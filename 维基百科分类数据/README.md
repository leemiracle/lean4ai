# 维基百科分类数据导出指南

## 一、维基百科官方Dump下载

### 中文维基百科
- 官方地址：https://dumps.wikimedia.org/zhwiki/
- 最新dump：https://dumps.wikimedia.org/zhwiki/latest/
- 主要文件：
  - `zhwiki-latest-category.sql.gz` - 分类信息
  - `zhwiki-latest-categorylinks.sql.gz` - 分类关联
  - `zhwiki-latest-page.sql.gz` - 页面信息
  - `zhwiki-latest-abstract.xml.gz` - 摘要信息

### 英文维基百科
- 官方地址：https://dumps.wikimedia.org/enwiki/
- 最新dump：https://dumps.wikimedia.org/enwiki/latest/
- 主要文件：
  - `enwiki-latest-category.sql.gz` - 分类信息
  - `enwiki-latest-categorylinks.sql.gz` - 分类关联
  - `enwiki-latest-page.sql.gz` - 页面信息

### 文件大小
- 中文维基：约50-100GB（解压后）
- 英文维基：约200-500GB（解压后）

---

## 二、使用说明

### 方案1：使用本工具包（推荐）
运行提供的Python脚本自动获取分类结构

### 方案2：使用官方dump
1. 下载对应的sql.gz文件
2. 解压导入MySQL数据库
3. 使用SQL查询提取分类结构

### 方案3：使用第三方工具
- WikiTaxi（Windows）：https://www.wikitaxi.org/
- Kiwix：https://www.kiwix.org/
- XOWA：https://gnosygnu.github.io/xowa/

---

## 三、数据格式说明

本工具包提供以下输出：
1. JSON格式分类树（便于程序处理）
2. Markdown格式分类树（便于人类阅读）
3. CSV格式分类列表（便于数据分析）
4. 可视化HTML分类树（便于浏览）

---

## 四、API限制说明

- 维基百科API限制：每秒最多50次请求
- 建议使用延时：每次请求间隔0.1秒以上
- 批量请求建议使用官方dump

---

## 五、相关资源

- 维基百科API文档：https://www.mediawiki.org/wiki/API:Main_page
- 分类API：https://www.mediawiki.org/wiki/API:Categorymembers
- 查询API：https://www.mediawiki.org/wiki/API:Query

---

生成时间：2026-03-27
