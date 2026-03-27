#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
维基百科分类结构提取工具
通过维基百科API获取分类层级结构
"""

import requests
import json
import time
from collections import defaultdict
import networkx as nx
from typing import Dict, List, Set

class WikipediaCategoryExtractor:
    """维基百科分类提取器"""
    
    def __init__(self, lang='zh'):
        """
        初始化
        :param lang: 语言版本 (zh=中文, en=英文)
        """
        self.lang = lang
        self.base_url = f'https://{lang}.wikipedia.org/w/api.php'
        self.session = requests.Session()
        self.session.headers.update({
            'User-Agent': 'WikipediaCategoryExtractor/1.0 (Educational purpose)'
        })
        
        # 缓存
        self.categories_cache = {}
        self.visited = set()
        
    def get_subcategories(self, category: str, limit=500) -> List[str]:
        """
        获取指定分类的子分类
        :param category: 分类名称
        :param limit: 一次请求返回的最大数量
        :return: 子分类列表
        """
        if category in self.categories_cache:
            return self.categories_cache[category]
            
        params = {
            'action': 'query',
            'list': 'categorymembers',
            'cmtitle': f'Category:{category}',
            'cmtype': 'subcat',
            'cmlimit': limit,
            'format': 'json'
        }
        
        try:
            response = self.session.get(self.base_url, params=params, timeout=30)
            response.raise_for_status()
            data = response.json()
            
            subcategories = []
            if 'query' in data and 'categorymembers' in data['query']:
                for member in data['query']['categorymembers']:
                    # 提取分类名称（去掉"Category:"前缀）
                    title = member['title']
                    if title.startswith('Category:'):
                        cat_name = title[9:]  # 去掉"Category:"
                        subcategories.append(cat_name)
            
            self.categories_cache[category] = subcategories
            return subcategories
            
        except Exception as e:
            print(f"Error fetching subcategories for {category}: {e}")
            return []
    
    def get_category_pages(self, category: str, limit=500) -> List[str]:
        """
        获取分类下的页面（非子分类）
        :param category: 分类名称
        :param limit: 一次请求返回的最大数量
        :return: 页面列表
        """
        params = {
            'action': 'query',
            'list': 'categorymembers',
            'cmtitle': f'Category:{category}',
            'cmtype': 'page',
            'cmlimit': limit,
            'format': 'json'
        }
        
        try:
            response = self.session.get(self.base_url, params=params, timeout=30)
            response.raise_for_status()
            data = response.json()
            
            pages = []
            if 'query' in data and 'categorymembers' in data['query']:
                for member in data['query']['categorymembers']:
                    pages.append(member['title'])
            
            return pages
            
        except Exception as e:
            print(f"Error fetching pages for {category}: {e}")
            return []
    
    def build_category_tree(self, root_category: str, max_depth: int = 3) -> Dict:
        """
        递归构建分类树
        :param root_category: 根分类
        :param max_depth: 最大深度
        :return: 分类树字典
        """
        if root_category in self.visited or max_depth <= 0:
            return {}
        
        self.visited.add(root_category)
        
        # 延时以遵守API限制
        time.sleep(0.1)
        
        tree = {
            'name': root_category,
            'children': []
        }
        
        subcategories = self.get_subcategories(root_category)
        print(f"{'  ' * (3-max_depth)}├─ {root_category}: {len(subcategories)} subcategories")
        
        for subcat in subcategories:
            child_tree = self.build_category_tree(subcat, max_depth - 1)
            if child_tree:
                tree['children'].append(child_tree)
        
        return tree
    
    def extract_all_categories(self, root_categories: List[str], max_depth: int = 3) -> Dict:
        """
        提取多个根分类的完整树
        :param root_categories: 根分类列表
        :param max_depth: 最大深度
        :return: 完整的分类树
        """
        result = {
            'metadata': {
                'language': self.lang,
                'root_categories': root_categories,
                'max_depth': max_depth,
                'timestamp': time.strftime('%Y-%m-%d %H:%M:%S')
            },
            'trees': []
        }
        
        for root_cat in root_categories:
            print(f"\n提取分类: {root_cat}")
            self.visited.clear()  # 清空访问记录
            tree = self.build_category_tree(root_cat, max_depth)
            result['trees'].append(tree)
        
        return result

def save_to_json(data: Dict, filename: str):
    """保存为JSON文件"""
    with open(filename, 'w', encoding='utf-8') as f:
        json.dump(data, f, ensure_ascii=False, indent=2)
    print(f"✓ 已保存到: {filename}")

def save_to_csv(data: Dict, filename: str):
    """保存为CSV格式"""
    import csv
    
    rows = []
    
    def flatten_tree(node, depth=0, parent=''):
        rows.append({
            'depth': depth,
            'category': node['name'],
            'parent': parent,
            'children_count': len(node.get('children', []))
        })
        for child in node.get('children', []):
            flatten_tree(child, depth + 1, node['name'])
    
    for tree in data.get('trees', []):
        flatten_tree(tree)
    
    with open(filename, 'w', encoding='utf-8', newline='') as f:
        if rows:
            writer = csv.DictWriter(f, fieldnames=rows[0].keys())
            writer.writeheader()
            writer.writerows(rows)
    
    print(f"✓ 已保存到: {filename}")

def main():
    """主函数"""
    print("=" * 60)
    print("维基百科分类结构提取工具")
    print("=" * 60)
    
    # 中文维基百科顶级分类
    zh_root_categories = [
        '所有分类',
        '维基百科',
        '人物',
        '历史',
        '地理',
        '社会',
        '自然科学',
        '技术',
        '人文',
        '艺术',
        '文化',
        '生活',
        '体育',
        '经济',
        '法律',
        '教育',
        '医学',
        '宗教',
        '哲学'
    ]
    
    # 英文维基百科顶级分类
    en_root_categories = [
        'Contents',
        'Wikipedia',
        'People',
        'History',
        'Geography',
        'Society',
        'Natural sciences',
        'Technology',
        'Humanities',
        'Arts',
        'Culture',
        'Life',
        'Sports',
        'Economics',
        'Law',
        'Education',
        'Medicine',
        'Religion',
        'Philosophy'
    ]
    
    # 提取中文维基百科分类
    print("\n" + "=" * 60)
    print("1. 提取中文维基百科分类结构")
    print("=" * 60)
    
    zh_extractor = WikipediaCategoryExtractor(lang='zh')
    zh_categories = zh_extractor.extract_all_categories(
        zh_root_categories[:10],  # 只提取前10个根分类，避免请求过多
        max_depth=2  # 深度设为2，避免数据量过大
    )
    
    save_to_json(zh_categories, '维基百科分类数据/zh_wikipedia_categories.json')
    save_to_csv(zh_categories, '维基百科分类数据/zh_wikipedia_categories.csv')
    
    # 提取英文维基百科分类
    print("\n" + "=" * 60)
    print("2. 提取英文维基百科分类结构")
    print("=" * 60)
    
    en_extractor = WikipediaCategoryExtractor(lang='en')
    en_categories = en_extractor.extract_all_categories(
        en_root_categories[:10],
        max_depth=2
    )
    
    save_to_json(en_categories, '维基百科分类数据/en_wikipedia_categories.json')
    save_to_csv(en_categories, '维基百科分类数据/en_wikipedia_categories.csv')
    
    print("\n" + "=" * 60)
    print("✓ 提取完成！")
    print("=" * 60)

if __name__ == '__main__':
    main()
