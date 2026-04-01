#!/bin/bash

echo "=== Lean4 实验文件检查 ==="
echo ""

cd /data/usershare/ai/lean4ai/Experiments || exit 1

total=$(ls *.lean 2>/dev/null | wc -l)
echo "✓ Lean文件总数: $total"

numbered=$(ls [0-9]*.lean 2>/dev/null | wc -l)
echo "✓ 编号实验文件: $numbered"

special=$(ls {README,AllExperiments}.lean 2>/dev/null | wc -l)
echo "✓ 特殊文件: $special"

md=$(ls *.md 2>/dev/null | wc -l)
echo "✓ Markdown文档: $md"

echo ""
echo "=== 文件列表 ==="
ls -1 *.lean | head -10
echo "..."
ls -1 *.lean | tail -5

echo ""
echo "=== 项目状态 ==="
if [ -f ../lakefile.toml ]; then
    echo "✓ lakefile.toml 存在"
else
    echo "✗ lakefile.toml 缺失"
fi

if [ -f ../lean-toolchain ]; then
    echo "✓ lean-toolchain 存在"
    echo "  版本: $(cat ../lean-toolchain)"
else
    echo "✗ lean-toolchain 缺失"
fi

echo ""
echo "检查完成！"
