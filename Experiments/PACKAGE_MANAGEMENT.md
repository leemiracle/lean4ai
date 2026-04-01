# 📦 Lean4 包管理完全指南（对比 Python pip）

## 1. 基础概念对比

| 操作 | Python (pip) | Lean4 (Lake) |
|------|--------------|--------------|
| **包管理器** | `pip` | `lake` |
| **项目配置** | `requirements.txt` | `lakefile.toml` |
| **项目定义** | `pyproject.toml` | `lakefile.toml` |
| **版本锁定** | `Pipfile.lock` | `lake-manifest.json` |
| **包仓库** | PyPI | GitHub |
| **解释器版本** | `.python-version` | `lean-toolchain` |
| **依赖缓存** | `~/.cache/pip` | `.lake/` |

---

## 2. 查看依赖

### Python
```bash
pip list                    # 列出所有包
pip show numpy             # 查看包详情
pip freeze                 # 导出依赖
cat requirements.txt        # 查看依赖配置
```

### Lean4
```bash
# 方式1: 查看配置文件
cat lakefile.toml

# 方式2: 列出项目目标
lake list

# 方式3: 查看依赖锁定（需要先 update）
cat lake-manifest.json
```

---

## 3. 安装依赖

### Python
```bash
pip install numpy           # 安装最新版
pip install numpy==1.24.0   # 安装指定版本
pip install -r requirements.txt  # 从文件安装
```

### Lean4
```bash
# 步骤1: 编辑 lakefile.toml
# [[require]]
# name = "mathlib"
# scope = "leanprover-community"
# rev = "v4.14.0"

# 步骤2: 更新依赖
lake update

# 步骤3: 构建项目
lake build
```

---

## 4. 常用包源

### 官方包
```toml
# Mathlib - 数学库
[[require]]
name = "mathlib"
scope = "leanprover-community"
rev = "v4.14.0"

# Std - 标准库
[[require]]
name = "std"
scope = "leanprover"
rev = "main"
```

### 社区包
```toml
# SciLean - 科学计算
[[require]]
name = "SciLean"
scope = "lecopivo"
rev = "main"

# Quote - 元编程
[[require]]
name = "quote"
scope = "tydeu"
rev = "main"
```

---

## 5. 实用命令

### Python
```bash
pip search <package>      # 搜索包
pip show <package>        # 查看详情
pip check                # 检查更新
pip uninstall <package>  # 卸载包
```

### Lean4
```bash
lake update               # 更新所有依赖
lake build                # 构建项目
lake clean                # 清理构建
lake env lean --version   # 查看版本
```

---

## 6. 工作流程

### Python 工作流
```bash
# 1. 创建虚拟环境
python -m venv venv
source venv/bin/activate

# 2. 安装依赖
pip install -r requirements.txt

# 3. 锁定版本
pip freeze > requirements.txt

# 4. 运行项目
python main.py
```

### Lean4 工作流
```bash
# 1. 创建项目
lake new my_project

# 2. 添加依赖 (编辑 lakefile.toml)
# 3. 更新依赖
lake update

# 4. 构建
lake build

# 5. 运行
lake exec my_app
```

---

## 7. 包索引

### Python
- PyPI: https://pypi.org/

### Lean4
- GitHub: https://github.com/leanprover-community
- Mathlib: https://github.com/leanprover-community/mathlib4
- Lean4 Wiki: https://github.com/leanprover/lean4/wiki/Lean-4-Packages

- Lean4 Zulip: https://leanprover.zulipchat.com/

---

## 8. 实战示例

### 添加 Mathlib 到项目

```bash
# 1. 编辑 lakefile.toml
cat >> lakefile.toml << 'EOF'
[[require]]
name = "mathlib"
scope = "leanprover-community"
rev = "v4.14.0"
EOF

# 2. 更新依赖
lake update mathlib

# 3. 构建项目
lake build

# 4. 在代码中使用
cat > Main.lean << 'EOF'
import Mathlib.Data.Real.Basic

#eval 1 + 2
EOF
```

---

## 9. 故障排除

### Python 常见问题
```bash
pip install -U --force <package>  # 强制重装
pip cache purge               # 清理缓存
```

### Lean4 常见问题
```bash
# 问题: 构建失败
# 解决:
lake clean                  # 清理构建
lake update                # 重新更新
lake build                 # 重新构建

# 问题: 版本不匹配
# 解决: 删除 .lake 和 lake-manifest.json
rm -rf .lake lake-manifest.json
lake update
lake build
```

---

## 10. 高级用法

### 多版本管理
```bash
# Python
pyenv versions           # 查看所有版本

# Lean4
elan toolchain list       # 查看所有工具链
elan show                # 显示当前工具链
```

### 依赖树
```bash
# Python
pipdeptree                # 查看依赖树

# Lean4
# 查看依赖树
cat lake-manifest.json | jq '.dependencies'
```

---

## 11. 最佳实践

### Python
- 使用虚拟环境
- 定期更新依赖
- 锁定版本 (Pipfile.lock)
- 最小化依赖

### Lean4
- 使用 `lean-toolchain` 固定版本
- 定期 `lake update`
- 提交 `lake-manifest.json`
- 最小化依赖（避免过度依赖 Mathlib）

---

## 12. 对比表总结

| 功能 | pip | lake |
|------|-----|------|
| **安装** | `pip install` | `lake update` |
| **列出** | `pip list` | `cat lakefile.toml` |
| **搜索** | `pip search` | GitHub 搜索 |
| **更新** | `pip install -U` | `lake update` |
| **卸载** | `pip uninstall` | 手动删除 |
| **清理** | `pip cache purge` | `lake clean` |
| **锁定** | `Pipfile.lock` | `lake-manifest.json` |
| **环境** | `venv` | `elan` |

---

## 📚 相关资源

- **Lake 文档**: https://leanprover.github.io/lean4/docs/make/lake.html
- **Mathlib 文档**: https://leanprover-community.github.io/
- **Lean4 教程**: https://leanprover.github.io/lean4/
- **包列表**: https://github.com/leanprover/lean4/wiki/Lean-4-Packages

