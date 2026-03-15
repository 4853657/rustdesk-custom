#!/bin/bash

# RustDesk 自定义构建 - 推送到 GitHub 脚本

echo "=========================================="
echo "  RustDesk 自定义构建 - GitHub 推送工具"
echo "=========================================="
echo

# 配置
REPO_URL=""
VERSION="1.4.6-custom"

echo "当前配置:"
echo "  服务器: rustdesk.hbspider.cn"
echo "  版本: $VERSION"
echo

# 检查是否在源码目录
if [ ! -f "Cargo.toml" ] || [ ! -d "libs/hbb_common" ]; then
    echo "错误: 请在 rustdesk 源码目录运行此脚本"
    exit 1
fi

# 获取仓库地址
if [ -z "$REPO_URL" ]; then
    read -p "请输入 GitHub 仓库地址 (例如: https://github.com/username/rustdesk-custom.git): " REPO_URL
fi

if [ -z "$REPO_URL" ]; then
    echo "错误: 必须提供 GitHub 仓库地址"
    exit 1
fi

echo
echo "正在初始化 Git 仓库..."

# 初始化 git
if [ ! -d ".git" ]; then
    git init
fi

# 添加所有文件
git add .

# 提交
git commit -m "Custom RustDesk build with pre-configured server

Server: rustdesk.hbspider.cn
- ID Server: rustdesk.hbspider.cn:21116
- Relay Server: rustdesk.hbspider.cn:21117
- Key: C3SQejCZTUvfDzLvvYPBR+k1TwCABFQ1AqFywSG1TN0=

Changes:
- Modified libs/hbb_common/src/config.rs
- Added .github/workflows/custom-build.yml"

# 添加远程仓库
if ! git remote | grep -q "origin"; then
    git remote add origin "$REPO_URL"
fi

# 推送
echo
echo "推送到 GitHub..."
git push -u origin main || git push -u origin master

echo
echo "创建标签 $VERSION..."
git tag -d "$VERSION" 2>/dev/null
git tag "$VERSION"
git push origin "$VERSION"

echo
echo "=========================================="
echo "  推送完成！"
echo "=========================================="
echo
echo "接下来:"
echo "1. 访问 GitHub 仓库页面"
echo "2. 点击 Actions 标签"
echo "3. 等待编译完成（约30-60分钟）"
echo "4. 在 Releases 页面下载编译好的版本"
echo
echo "或者手动触发:"
echo "  进入 Actions -> Build Custom RustDesk -> Run workflow"
echo
