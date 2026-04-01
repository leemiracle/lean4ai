#!/bin/bash

# 交互式查看包信息

echo "=== Lean4 包管理工具 (类似 pip) ==="
echo ""

# 1. 查看当前项目的 lakefile.toml
echo "=== 当前项目配置 (lakefile.toml) ==="
cat lakefile.toml

echo ""
echo "当前项目: Lean4Experiments"
echo "当前版本: 0.1.0"
echo "当前没有依赖"

echo ""

# 2. 查看依赖锁定文件 (如果存在)
if [ -f lake-manifest.json ]; then
    echo ""
    echo "=== lake-manifest.json (依赖锁定) ==="
    cat lake-manifest.json
else
    echo ""
    echo "⚠️  未找到 lake-manifest.json (需要先运行 'lake update')"
fi

echo ""

# 3. 显示帮助
echo ""
echo "=== 常用 Lake 徽令 ==="
echo "lake update              # 更新/安装依赖"
echo "lake build               # 构建项目"
echo "lake list                # 列出目标"
echo "lake clean                # 清理构建"
echo "lake upload <pkg>         # 上传包到 GitHub"
echo ""

echo ""
echo "✅ 完成！"
