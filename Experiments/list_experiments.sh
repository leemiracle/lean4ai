#!/bin/bash

echo "╔══════════════════════════════════════════════════════════════╗"
echo "║        Lean4 实验室 - 完整实验清单                 ║"
echo "╚══════════════════════════════════════════════════════════════╝"
echo ""

cd /data/usershare/ai/lean4ai/Experiments || exit 1

total=$(ls *.lean 2>/dev/null | wc -l)
numbered=$(ls [0-9]*.lean 2>/dev/null | wc -l)
special=$(ls {README,AllExperiments}.lean 2>/dev/null | wc -l)
md=$(ls *.md 2>/dev/null | wc -l)

echo "📊 统计信息"
echo "  Lean 文件总数: $total"
echo "  编号实验文件: $numbered"
echo "  特殊文件: $special"
echo "  Markdown 文档: $md"
echo ""

echo "📂 文件列表"
echo ""
echo "══════════════════════════════════════════════════════════════"
echo "                    基础特性 (01-20)"
echo "══════════════════════════════════════════════════════════════"
ls -1 [0-1]*.lean [2][0-9].lean 2>/dev/null | head -20

echo ""
echo "══════════════════════════════════════════════════════════════"
echo "                    算法和数据结构 (21-40)"
echo "══════════════════════════════════════════════════════════════"
ls -1 [2-3][0-9].lean 2>/dev/null | head -20

echo ""
echo "══════════════════════════════════════════════════════════════"
echo "                    理论和高级特性 (41-60)"
echo "══════════════════════════════════════════════════════════════"
ls -1 [4-5][0-9].lean 2>/dev/null | head -20

echo ""
echo "══════════════════════════════════════════════════════════════"
echo "                    扩展机制 (61-68)"
echo "══════════════════════════════════════════════════════════════"
ls -1 [6][0-8].lean 2>/dev/null

echo ""
echo "══════════════════════════════════════════════════════════════"
echo "                    文档和配置"
echo "══════════════════════════════════════════════════════════════"
ls -1 *.md README.lean AllExperiments.lean 2>/dev/null

echo ""
echo "══════════════════════════════════════════════════════════════"
echo "                    项目配置"
echo "══════════════════════════════════════════════════════════════"
if [ -f ../lakefile.toml ]; then
    echo "✓ lakefile.toml 存在"
else
    echo "✗ lakefile.toml 缺失"
fi

if [ -f ../lean-toolchain ]; then
    echo "✓ lean-toolchain 存在 ($(cat ../lean-toolchain))"
else
    echo "✗ lean-toolchain 缺失"
fi

echo ""
echo "✅ 检查完成！"
