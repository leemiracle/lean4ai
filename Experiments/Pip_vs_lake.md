# 📦 Lean4 包管理完全指南 (对比 Python pip)

## 1. 核心概念对比

| 概念 | Python | Lean4 |
|------|--------|-------|
| **包管理器** | pip | lake |
| **配置文件** | requirements.txt | lakefile.toml |
| **项目配置** | pyproject.toml | lakefile.toml |
| **版本锁定** | Pipfile.lock | lake-manifest.json |
| **解释器版本** | .python-version | lean-toolchain |
| **依赖源** | PyPI | GitHub/Git |
| **虚拟环境** | venv | 无 |

| **安装目录** | site-packages/ | .lake |

| **缓存目录** | __pycache__/ | .lake/build |

---

## 2. 常用命令对比

### 2.1 查看已安装的包

#### Python (pip)
```bash
pip list                    # 列出所有包
pip show numpy              # 查看包详情
pip freeze                  # 导出依赖
```

#### Lean4 (lake)
```bash
lake list                  # 列出所有目标
cat lakefile.toml           # 查看依赖配置
cat lake-manifest.json      # 查看锁定版本
```

---

### 2.2 安装/添加依赖

#### Python (pip)
```bash
pip install numpy           # 安装包
pip install numpy==1.24.0   # 指定版本
```

#### Lean4 (lake)
```bash
# 编辑 lakefile.toml 添加依赖
[[require]]
name = "mathlib"
scope = "leanprover-community"
rev = "v4.14.0"

# 然后更新
lake update mathlib
lake build
```

---

### 2.3 更新包
#### Python (pip)
```bash
pip install --upgrade numpy
pip install --upgrade pip
```

#### Lean4 (lake)
```bash
lake update mathlib        # 更新特定包
lake update                # 更新所有包
lake build                 # 重新构建
```
---

### 2.4 搜索包
#### Python (pip)
```bash
pip search numpy           # 搜索包
```
#### Lean4 (lake)
```bash
# Lean4 没有中央仓库，需要手动查找
# 1. GitHub 搜索: https://github.com/search?q=lean4
# 2. Mathlib: https://github.com/leanprover-community/mathlib4
# 3. Lean4 包索引: https://github.com/leanprover/lean4/wiki/Lean-4-Packages
```

---

### 2.5 查看包详情
#### Python (pip)
```bash
pip show numpy
Name: numpy
Version: 1.24.0
Summary: Scientific computing tools for Python
Location: /usr/local/lib/python3.11/site-packages/numpy
Requires: Python >= 1.20
```
#### Lean4 (lake)
```bash
lake list
```

---

### 2.6 导出依赖
#### Python (pip)
```bash
pip freeze > requirements.txt
```

#### Lean4 (lake)
```bash
cat lakefile.toml          # 依赖配置
# 或使用 git 保存
git add lakefile.toml
```
---

## 3. 包管理实战

### 示例 1: 查看当前项目依赖
```bash
cd /data/usershare/ai/lean4ai
cat lakefile.toml
```
### 示例 2: 查看 Mathlib 是否安装
```bash
cd lean4-projects/YC-Killer-Lean4
cat lakefile.toml
```
### 示例 3: 查看 lake 缓存
```bash
cd lean4-projects/YC-Killer-Lean4
ls -la lake-packages/lib 2>/dev/null | head -5
ls lake-packages/lib/mathlib/
```
### 示例 4: 查看包的版本
```bash
cat lean4-projects/YC-Killer-Lean4/lake-packages/lib/mathlib/lean-toolchain
```
### 示例 5: 查看 Mathlib 的 lake-manifest.json
```bash
cat lean4-projects/YC-Killer-Lean4/lake-packages/mathlib/manifest.json 2>/dev/null || head -10
```
---

## 4. 巻加新的 Lean4 包

### 示例： 添加 Mathlib 到当前项目
编辑 `/data/usershare/ai/lean4ai/lakefile.toml`：
```toml
[[require]]
name = "mathlib"
scope = "leanprover-community"
rev = "v4.14.0"
```

然后运行：
```bash
lake update mathlib
```

这将下载 Mathlib 并构建项目。

---

### 示例 2: 添加 SciLean（科学计算库)
```toml
[[require]]
name = "SciLean"
scope = "lecopivo"
rev = "main"
```
---

## 5. 埥看项目结构
```bash
# 查看项目目录
tree -L 2
/data/usershare/ai/lean4ai
├── Experiments/          # 实验文件 (70个)
├── lakefile.toml           # 项目配置
├── lean-toolchain         # Lean 版本
├── README.md              # 项目说明
└── lean4-projects/           # 其他项目
    ├── YC-Killer-Lean4/
    ├── lakefile.toml       # 项目配置
    ├── lake-packages/   # 依赖缓存
    │   └── mathlib/      # Mathlib 库
```

---

## 6. 常见问题

### Q1: `lake update` 很慢怎么办？
```bash
# 使用国内镜像（推荐）
lake -R https://mirrors.tuna.tsinghua.edu/help/m-std download mathlib

```

### Q2: `lake build` 报错怎么办？
```bash
# 清理并重试
lake clean
lake build
```

---

## 7. 推荐的 Lean4 包索引

- **Mathlib**: https://github.com/leanprover-community/mathlib4
- **SciLean**: https://github.com/lecopivo/SciLean
- **标准库**: https://github.com/leanprover/lean4/tree/master/src/Std
- **社区包**: https://github.com/leanprover-community

lean4-web

- **官方示例**: https://github.com/leanprover/lean4/tree/master/src/Examples

