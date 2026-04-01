#!/bin/bash

echo "══════════════════════════════════════════════════════════"
echo "       Lean4 包管理工具 (类似 Python pip)       "
echo "══════════════════════════════════════════════════════════"
echo ""

# 颜色定义
GREEN='\033[0;32;40'
YELLOW='\033[0;33;43m'
CYAN='\033[0;36;46m'
NC='\033[0m'

echo -e "${GREEN}1. 查看项目配置${NC}"
echo ""
echo "=== lakefile.toml ==="
cat lakefile.toml
echo ""
echo -e "${YELLOW}项目名: $(grep '^name' lakefile.toml)${NC}"
echo -e "${YELLOW}版本= $(grep '^version' lakefile.toml)${NC}"
echo ""

if [ -f lean-toolchain ]; then
    echo -e "${GREEN}2. Lean 版本${NC}"
    echo ""
    echo "=== lean-toolchain ==="
    cat lean-toolchain
    echo ""
fi

echo -e "${GREEN}3. 查看依赖状态${NC}"
echo ""
if [ -f lake-manifest.json ]; then
    echo "✅ lake-manifest.json 存在"
    echo ""
    echo "已安装的依赖:"
    cat lake-manifest.json | grep -E '"name"|"version"' | head -10
else
    echo "⚠️  lake-manifest.json 不存在"
    echo "   需要先运行: lake update"
fi
echo ""

echo -e "${GREEN}4. 查看已安装的包${NC}"
echo ""
if [ -d "lake-packages" ]; then
    echo "✅ lake-packages/ 存在"
    echo ""
    echo "已安装的包:"
    ls -1 lake-packages/
else
    echo "⚠️  lake-packages/ 不存在"
    echo "   需要先运行: lake update"
fi
echo ""

echo -e "${GREEN}5. 查看构建缓存${NC}"
echo ""
if [ -d ".lake" ]; then
    echo "✅ .lake/ 枘在 (构建缓存)"
    echo ""
    echo "缓存内容:"
    ls -la .lake/ | head -10
else
    echo "⚠️  .lake/ 不存在"
    echo "   需要先运行: lake build"
fi
echo ""

echo -e "${GREEN}6. pip vs Lake 命令对比${NC}"
echo ""
echo "pip 命令                    Lake 命令                    说明"
echo "─────────────────────────────────────────────────────────────"
echo "pip list                   lake list                    列出包"
echo "pip install <pkg>          lake update + lake build     安装包"
echo "pip show <pkg>             cat lake-manifest.json      查看详情"
echo "pip freeze                 cat lakefile.toml             导出依赖"
echo "pip search <pkg>           GitHub 搜索               搜索包"
echo "pip cache purge            lake clean                    清理缓存"
echo ""

echo -e "${CYAN}实用技巧:${NC}"
echo ""
echo "添加依赖的步骤:"
echo "  1. 编辑 lakefile.toml"
echo "  2. 运行 lake update"
echo "  3. 运行 lake build"
echo ""
echo "常用包源:"
echo "  - Mathlib: https://github.com/leanprover-community/mathlib4"
echo "  - SciLean: https://github.com/lecopivo/SciLean"
echo "  - Std: https://github.com/leanprover/lean4/tree/master/src/Std"
echo ""
echo "搜索包:"
echo "  - GitHub: 搜索 'lean4' 或 'mathlib'"
echo "  - Lean4 Zulip: https://leanprover.zulipchat.com/"
echo "  - Lean4 Wiki: https://github.com/leanprover/lean4/wiki"
echo ""

echo "══════════════════════════════════════════════════════════"
