#!/bin/bash

echo "╔══════════════════════════════════════════════════════════════╗"
echo "║          Lean4 依赖查看工具                                 ║"
echo "╚══════════════════════════════════════════════════════════════╝"
echo ""

# 检查是否在 Lean 项目目录
if [ ! -f "lakefile.toml" ] && [ ! -f "lakefile.lean" ]; then
    echo "❌ 错误: 未找到 lakefile.toml 或 lakefile.lean"
    echo "请在 Lean4 项目根目录运行此脚本"
    exit 1
fi

echo "📋 配置文件 (lakefile.toml)"
echo "══════════════════════════════════════════════════════════════"
if [ -f "lakefile.toml" ]; then
    cat lakefile.toml
elif [ -f "lakefile.lean" ]; then
    cat lakefile.lean
fi

echo ""
echo "📦 依赖列表"
echo "══════════════════════════════════════════════════════════════"
if grep -q "\[\[require\]\]" lakefile.toml 2>/dev/null; then
    echo "从 lakefile.toml:"
    grep -A3 "\[\[require\]\]" lakefile.toml | grep -v "^--$"
elif grep -q "require" lakefile.lean 2>/dev/null; then
    echo "从 lakefile.lean:"
    grep -A3 "require" lakefile.lean | head -20
else
    echo "未找到依赖配置"
fi

echo ""
echo "🔐 锁定版本 (lake-manifest.json)"
echo "══════════════════════════════════════════════════════════════"
if [ -f "lake-manifest.json" ]; then
    if command -v jq &> /dev/null; then
        cat lake-manifest.json | jq -r '.packages[]? | "  \(.name): \(.version // "latest" ) (\(.src // "local"))"' 2>/dev/null || cat lake-manifest.json
    else
        cat lake-manifest.json
    fi
else
    echo "  未找到 lake-manifest.json (运行 'lake update' 生成)"
fi

echo ""
echo "📂 已安装的包 (lake-packages/)"
echo "══════════════════════════════════════════════════════════════"
if [ -d "lake-packages" ]; then
    ls -1 lake-packages/ | while read pkg; do
        if [ -d "lake-packages/$pkg" ]; then
            version=""
            if [ -f "lake-packages/$pkg/lean-toolchain" ]; then
                version=$(cat "lake-packages/$pkg/lean-toolchain")
            fi
            if [ -d "lake-packages/$pkg/.git" ]; then
                branch=$(cd "lake-packages/$pkg" && git branch --show-current 2>/dev/null)
                tag=$(cd "lake-packages/$pkg" && git describe --tags --exact-match 2>/dev/null)
                if [ -n "$tag" ]; then
                    echo "  📦 $pkg (tag: $tag, lean: $version)"
                elif [ -n "$branch" ]; then
                    echo "  📦 $pkg (branch: $branch, lean: $version)"
                else
                    echo "  📦 $pkg (lean: $version)"
                fi
            else
                echo "  📦 $pkg (lean: $version)"
            fi
        fi
    done
else
    echo "  lake-packages/ 目录不存在"
    echo "  运行 'lake update' 下载依赖"
fi

echo ""
echo "ℹ️  Lean 版本"
echo "══════════════════════════════════════════════════════════════"
if [ -f "lean-toolchain" ]; then
    echo "  $(cat lean-toolchain)"
else
    echo "  未找到 lean-toolchain"
fi

echo ""
echo "💡 提示"
echo "══════════════════════════════════════════════════════════════"
echo "  • 添加依赖: 编辑 lakefile.toml 添加 [[require]] 块"
echo "  • 更新依赖: lake update"
echo "  • 构建项目: lake build"
echo "  • 清理构建: lake clean"
echo ""
echo "✅ 完成！"
