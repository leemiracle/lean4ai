#!/bin/bash

# 颜色定义
RED='\033[0;31;40'
GREEN='\033[0;32;40'
YELLOW='\033[0;33;43m'
BLUE='\033[0;34;44m'
PURPLE='\033[0;35;45m'
CYAN='\033[0;36;46m'
WHITE='\033[0;37;47m'
NC='\033[0m'

echo -e "${CYAN}╔══════════════════════════════════════════════════════════════╗${NC}"
echo -e "${WHITE}║          Lean4 包管理 - 类似 pip          ${NC}"
echo -e "${CYAN}╚══════════════════════════════════════════════════════════════╝${NC}"
echo ""

# 1. 当前项目信息
echo -e "${YELLOW}▶ 当前项目配置:${NC}"
echo ""
if [ -f "lakefile.toml" ]; then
    echo -e "${GREEN}✓ lakefile.toml 存在${NC}"
    echo ""
    echo "内容:"
    echo "----------------------------------------"
    cat lakefile.toml
    echo ""
else
    echo -e "${RED}✗ lakefile.toml 不存在${NC}"
fi

echo ""

# 2. Lean 版本
echo -e "${YELLOW}▶ Lean 版本:${NC}"
echo ""
if [ -f "lean-toolchain" ]; then
    echo -e "${GREEN}✓ lean-toolchain: $(cat lean-toolchain)${NC}"
else
    echo -e "${RED}✗ lean-toolchain 不存在${NC}"
fi
echo ""

# 3. 依赖锁定文件
echo -e "${YELLOW}▶ 依赖锁定文件:${NC}"
echo ""
if [ -f "lake-manifest.json" ]; then
    echo -e "${GREEN}✓ lake-manifest.json 存在${NC}"
    echo ""
    echo "依赖数量: $(cat lake-manifest.json | grep -c '"name"' | wc -l)"
    echo ""
    echo "已安装的依赖:"
    cat lake-manifest.json | grep '"name"' | head -5
    echo ""
else
    echo -e "${YELLOW}⚠️  未找到 lake-manifest.json${NC}"
    echo "   需要先运行: ${CYAN}lake update${NC}"
    echo ""
fi

echo ""

# 4. 缓存目录
echo -e "${YELLOW}▶ 缄建缓存:${NC}"
echo ""
if [ -d ".lake" ]; then
    echo -e "${GREEN}✓ .lake/ 目录存在${NC}"
    echo "   大小: $(du -sh .lake | cut -f1)"
    echo "   文件数: $(find .lake -type f | wc -l)"
else
    echo -e "${YELLOW}⚠️  未找到 .lake/ 目录${NC}"
    echo "   需要先运行: ${CYAN}lake build${NC}"
fi
echo ""

# 5. 查找已安装的包
echo -e "${YELLOW}▶ 查找已安装的 Lean4 包:${NC}"
echo ""
if [ -d "lake-packages" ]; then
    echo -e "${GREEN}✓ lake-packages/ 存在${NC}"
    echo ""
    echo "已安装的包:"
    ls -1 lake-packages/ 2>/dev/null | while read pkg; do
        if [ -f "lake-packages/$pkg/lakefile.toml" ]; then
            name=$(grep "^name" "lake-packages/$pkg/lakefile.toml" | cut -d'=' -f2 | tr -d '"')
            version=$(grep "^version" "lake-packages/$pkg/lakefile.toml" | cut -d'=' -f2 | tr -d '"')
            echo "  📦 $name (版本: $version)"
        fi
    done
else
    echo -e "${YELLOW}⚠️  未找到 lake-packages/ 目录${NC}"
    echo "   需要先运行: ${CYAN}lake update${NC}"
fi
echo ""

# 6. 常用命令
echo -e "${YELLOW}▶ 娡拟 pip 的 Lake 命令:${NC}"
echo ""
echo -e "${CYAN}pip 命令          Lake 命令                    说明${NC}"
echo "─────────────────────────────────────────────────────────────"
echo -e "${WHITE}pip list             lake list                    列出包${NC}"
echo -e "${WHITE}pip install         lake update + lake build     安装包${NC}"
echo -e "${WHITE}pip show             cat lake-manifest.json      查看详情${NC}"
echo -e "${WHITE}pip freeze          cat lakefile.toml             导出依赖${NC}"
echo -e "${WHITE}pip search           GitHub 搜索               搜索包${NC}"
echo ""

# 7. 实用命令
echo -e "${YELLOW}▶ 实用 Lake 命令:${NC}"
echo ""
echo -e "${CYAN}lake update${NC}              - 更新/安装依赖 (类似 pip install)"
echo -e "${CYAN}lake build${NC}               - 构建项目 (类似 pip install 后的构建)"
echo -e "${CYAN}lake list${NC}                - 列出目标 (类似 pip list)
echo -e "${CYAN}lake clean${NC}                - 清理构建 (类似 pip cache purge)
echo -e "${CYAN}lake env lean --version${NC}  - 查看版本 (类似 python --version)
echo ""

# 8. 依赖源
echo -e "${YELLOW}▶ Lean4 包源 (类似 PyPI):${NC}"
echo ""
echo "  • GitHub: https://github.com/leanprover-community"
echo "  • Mathlib: https://github.com/leanprover-community/mathlib4"
echo "  • 包索引: https://github.com/leanprover/lean4/wiki/Lean-4-Packages"
echo "  • Zulip: https://leanprover.zulipchat.com/"
echo ""

# 9. 快速开始
echo -e "${YELLOW}▶ 快速开始指南:${NC}"
echo ""
echo "1. ${CYAN}添加依赖到 lakefile.toml:${NC}"
echo "   编辑 lakefile.toml， 添加:"
echo "   [[require]]"
echo "   name = \"mathlib\""
echo "   scope = \"leanprover-community\""
echo "   rev = \"v4.14.0\""
echo ""
echo "2. ${CYAN}安装依赖:${NC}"
echo "   lake update"
echo ""
echo "3. ${CYAN}构建项目:${NC}"
echo "   lake build"
echo ""
echo "4. ${CYAN}使用依赖:${NC}"
echo "   import Mathlib.Data.Real.Basic"
echo ""

echo -e "${GREEN}✅ 检查完成!${NC}"
echo ""
echo -e "${WHITE}更多信息请查看: PACKAGE_MANAGEMENT.md${NC}"
