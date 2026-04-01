# Python数据分析教程

## 概述
Python是数据科学领域最流行的编程语言之一,配合Pandas、NumPy、Matplotlib等库,可以高效完成数据清洗、分析和可视化任务。

## 核心库介绍

### Pandas
- DataFrame数据结构
- 数据读取与存储
- 数据清洗与处理
- 数据分析与聚合

### NumPy
- 多维数组对象
- 数学运算
- 线性代数
- 随机数生成

### Matplotlib/Seaborn
- 基础绑图
- 统计图表
- 图表美化
- 交互式可视化

## 常用快捷键(Jupyter Notebook)

| 快捷键 | 功能 |
|--------|------|
| Enter | 进入编辑模式 |
| Esc | 进入命令模式 |
| Shift+Enter | 运行当前单元格并跳转下一个 |
| Ctrl+Enter | 运行当前单元格 |
| Alt+Enter | 运行当前单元格并在下方插入 |
| A | 在上方插入单元格 |
| B | 在下方插入单元格 |
| DD | 删除单元格 |
| Z | 撤销删除 |
| Y | 切换为代码单元格 |
| M | 切换为Markdown单元格 |
| Ctrl+Shift+- | 分割单元格 |
| Shift+Tab | 查看函数帮助 |

## 使用指南

### 环境配置
```python
# 安装库
pip install pandas numpy matplotlib seaborn jupyter

# 导入库
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import seaborn as sns

# 设置显示
pd.set_option('display.max_columns', None)
pd.set_option('display.max_rows', 100)
plt.rcParams['font.sans-serif'] = ['SimHei']  # 中文显示
plt.rcParams['axes.unicode_minus'] = False     # 负号显示
```

### 数据读取与存储
```python
# 读取CSV
df = pd.read_csv('data.csv', encoding='utf-8')

# 读取Excel
df = pd.read_excel('data.xlsx', sheet_name='Sheet1')

# 读取SQL
import sqlite3
conn = sqlite3.connect('database.db')
df = pd.read_sql('SELECT * FROM table', conn)

# 保存数据
df.to_csv('output.csv', index=False, encoding='utf-8')
df.to_excel('output.xlsx', index=False)
```

### 数据探索
```python
# 查看数据
df.head()              # 前5行
df.tail()              # 后5行
df.info()              # 数据信息
df.describe()          # 统计描述
df.shape               # 数据维度
df.columns             # 列名
df.dtypes              # 数据类型

# 数据筛选
df['column']                     # 选择列
df[['col1', 'col2']]             # 选择多列
df[df['column'] > 100]           # 条件筛选
df[(df['col1'] > 100) & (df['col2'] == 'A')]  # 多条件筛选
```

### 数据清洗
```python
# 缺失值处理
df.isnull().sum()                # 统计缺失值
df.dropna()                      # 删除缺失行
df.dropna(axis=1)                # 删除缺失列
df.fillna(0)                     # 填充缺失值
df['col'].fillna(df['col'].mean())  # 用均值填充

# 重复值处理
df.duplicated().sum()            # 统计重复值
df.drop_duplicates()             # 删除重复行

# 数据类型转换
df['date'] = pd.to_datetime(df['date'])
df['amount'] = df['amount'].astype(float)

# 字符串处理
df['col'].str.strip()            # 去空格
df['col'].str.replace('a', 'b')  # 替换
df['col'].str.split(',')         # 分割
df['col'].str.contains('关键词')  # 包含判断
```

### 数据分析
```python
# 基础统计
df['column'].sum()               # 求和
df['column'].mean()              # 平均值
df['column'].median()            # 中位数
df['column'].std()               # 标准差
df['column'].max()               # 最大值
df['column'].min()               # 最小值
df['column'].count()             # 计数

# 分组统计
df.groupby('category')['amount'].sum()           # 单列分组求和
df.groupby(['city', 'category']).agg({           # 多列分组聚合
    'amount': 'sum',
    'user_id': 'count',
    'price': 'mean'
})

# 数据透视
pd.pivot_table(df, 
               values='amount', 
               index='city', 
               columns='category', 
               aggfunc='sum')

# 排序
df.sort_values('column', ascending=False)
df.nlargest(10, 'column')        # 取最大10条
```

## 实战案例

### 案例1:用户行为分析
```python
import pandas as pd
import matplotlib.pyplot as plt

# 读取数据
df = pd.read_csv('user_behavior.csv')

# 日活分析
dau = df.groupby('date')['user_id'].nunique()
dau.plot(kind='line', figsize=(12, 6))
plt.title('日活用户趋势')
plt.xlabel('日期')
plt.ylabel('用户数')
plt.show()

# 留存分析
def calculate_retention(df):
    # 计算每个用户的首次访问日期
    df['first_date'] = df.groupby('user_id')['date'].transform('min')
    # 计算访问日期与首次日期的天数差
    df['days_since_first'] = (pd.to_datetime(df['date']) - pd.to_datetime(df['first_date'])).dt.days
    
    # 计算留存
    retention = df.groupby(['first_date', 'days_since_first'])['user_id'].nunique().unstack()
    return retention

retention = calculate_retention(df)

# 留存热力图
import seaborn as sns
plt.figure(figsize=(15, 8))
sns.heatmap(retention.iloc[:, :7], annot=True, fmt='.0f', cmap='YlOrRd')
plt.title('用户留存热力图')
plt.show()
```

### 案例2:销售数据分析
```python
import pandas as pd
import matplotlib.pyplot as plt

# 读取销售数据
sales = pd.read_csv('sales.csv', parse_dates=['date'])

# 数据清洗
sales = sales.dropna(subset=['amount'])
sales['amount'] = sales['amount'].astype(float)

# 月度销售趋势
monthly = sales.groupby(sales['date'].dt.to_period('M')).agg({
    'order_id': 'count',
    'amount': 'sum'
}).reset_index()
monthly['date'] = monthly['date'].astype(str)

# 可视化
fig, ax1 = plt.subplots(figsize=(12, 6))

ax1.bar(monthly['date'], monthly['order_id'], color='skyblue', alpha=0.7, label='订单数')
ax1.set_xlabel('月份')
ax1.set_ylabel('订单数', color='skyblue')

ax2 = ax1.twinx()
ax2.plot(monthly['date'], monthly['amount'], color='red', marker='o', label='销售额')
ax2.set_ylabel('销售额', color='red')

plt.title('月度销售趋势')
plt.xticks(rotation=45)
plt.show()

# 商品销售排行
top_products = sales.groupby('product_name').agg({
    'order_id': 'count',
    'amount': 'sum'
}).sort_values('amount', ascending=False).head(10)

print(top_products)
```

### 案例3:RFM用户分层
```python
import pandas as pd
import numpy as np

# 读取用户订单数据
orders = pd.read_csv('orders.csv', parse_dates=['order_date'])

# 计算RFM
current_date = orders['order_date'].max() + pd.Timedelta(days=1)

rfm = orders.groupby('user_id').agg({
    'order_date': lambda x: (current_date - x.max()).days,  # Recency
    'order_id': 'count',                                     # Frequency
    'amount': 'sum'                                          # Monetary
}).reset_index()

rfm.columns = ['user_id', 'recency', 'frequency', 'monetary']

# RFM打分
rfm['r_score'] = pd.qcut(rfm['recency'], 5, labels=[5,4,3,2,1])
rfm['f_score'] = pd.qcut(rfm['frequency'].rank(method='first'), 5, labels=[1,2,3,4,5])
rfm['m_score'] = pd.qcut(rfm['monetary'].rank(method='first'), 5, labels=[1,2,3,4,5])

# 用户分层
def classify_user(row):
    if row['r_score'] >= 4 and row['f_score'] >= 4 and row['m_score'] >= 4:
        return '重要价值用户'
    elif row['r_score'] >= 4 and row['f_score'] < 4:
        return '重要发展用户'
    elif row['r_score'] < 4 and row['f_score'] >= 4:
        return '重要保持用户'
    else:
        return '一般用户'

rfm['user_segment'] = rfm.apply(classify_user, axis=1)

# 分层统计
segment_stats = rfm.groupby('user_segment').agg({
    'user_id': 'count',
    'monetary': ['sum', 'mean']
}).round(2)

print(segment_stats)
```

## 最佳实践

### 1. 代码规范
```python
# 使用有意义的变量名
user_data = pd.read_csv('users.csv')

# 添加注释说明
# 计算用户留存率
retention_rate = retained_users / total_users

# 函数封装重复逻辑
def clean_data(df):
    """数据清洗函数"""
    df = df.dropna()
    df = df.drop_duplicates()
    return df
```

### 2. 性能优化
```python
# 使用向量化操作
df['total'] = df['price'] * df['quantity']  # 好
# for i in range(len(df)):                  # 避免
#     df.loc[i, 'total'] = df.loc[i, 'price'] * df.loc[i, 'quantity']

# 使用合适的数据类型
df['id'] = df['id'].astype('int32')
df['category'] = df['category'].astype('category')
```

### 3. 可视化优化
```python
# 设置图表风格
plt.style.use('seaborn')

# 添加图表元素
plt.title('图表标题')
plt.xlabel('X轴标签')
plt.ylabel('Y轴标签')
plt.legend()

# 调整布局
plt.tight_layout()
```

## 进阶技巧

### 数据合并
```python
# 数据拼接
pd.concat([df1, df2], axis=0)     # 纵向
pd.concat([df1, df2], axis=1)     # 横向

# 数据关联
pd.merge(df1, df2, on='key', how='left')
df1.join(df2, on='key')
```

### 时间序列
```python
# 重采样
df.resample('D').sum()            # 按天
df.resample('M').mean()           # 按月
df.resample('W').count()          # 按周

# 滚动计算
df.rolling(window=7).mean()       # 7天移动平均
```

### 统计分析
```python
# 相关性分析
df.corr()

# 交叉表
pd.crosstab(df['col1'], df['col2'])

# 描述性统计
df.describe(include='all')
```

## 常见问题

### Q: 如何处理大数据文件?
A: 使用chunksize分块读取,或使用Dask库

### Q: 如何调试代码?
A: 使用print()输出中间结果,或使用Jupyter Notebook逐步执行

### Q: 如何提高运行速度?
A: 使用向量化操作、优化数据类型、避免循环

## 学习资源
- Python官方文档
- Pandas官方文档
- 数据分析实战书籍
- 在线课程与教程

## 应用场景
- 用户行为分析
- 业务数据统计
- 数据可视化报表
- 数据建模预测
- 自动化数据处理
