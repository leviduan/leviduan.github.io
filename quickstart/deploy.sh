#!/bin/bash

# Hugo 博客自动构建和发布脚本
# 使用方法: ./deploy.sh

set -e  # 遇到错误立即退出

# 颜色输出
GREEN='\033[0;32m'
BLUE='\033[0;34m'
RED='\033[0;31m'
NC='\033[0m' # No Color

echo -e "${BLUE}========================================${NC}"
echo -e "${BLUE}开始构建和发布博客...${NC}"
echo -e "${BLUE}========================================${NC}"

# 项目路径
HUGO_PROJECT="/Users/levi/Code/blog/2025BlogServer/quickstart"
GITHUB_PAGES="/Users/levi/Code/leviduan.github.io"

# 1. 清理并构建 Hugo 站点
echo -e "\n${BLUE}[1/4] 清理 Hugo 缓存...${NC}"
cd "$HUGO_PROJECT"
rm -f .hugo_build.lock
rm -rf resources/_gen

echo -e "\n${BLUE}[2/4] 构建 Hugo 站点...${NC}"
hugo --minify

if [ $? -eq 0 ]; then
    echo -e "${GREEN}✓ Hugo 构建成功${NC}"
else
    echo -e "${RED}✗ Hugo 构建失败${NC}"
    exit 1
fi

# 2. 清理并复制文件到 GitHub Pages 仓库
echo -e "\n${BLUE}[3/4] 复制文件到 GitHub Pages 仓库...${NC}"
cd "$GITHUB_PAGES"

# 清理目标目录（保留 .git 和 .DS_Store）
find . -maxdepth 1 ! -name '.' ! -name '..' ! -name '.git' ! -name '.DS_Store' -exec rm -rf {} +

# 复制新构建的文件
cp -r "$HUGO_PROJECT/public/"* .

echo -e "${GREEN}✓ 文件复制完成${NC}"

# 3. Git 提交和推送
echo -e "\n${BLUE}[4/4] 提交并推送到 GitHub...${NC}"
git add -A

# 检查是否有变化
if git diff --staged --quiet; then
    echo -e "${GREEN}✓ 没有新的变化需要提交${NC}"
else
    # 生成提交信息（包含时间戳）
    COMMIT_MSG="Update site content - $(date '+%Y-%m-%d %H:%M:%S')"
    git commit -m "$COMMIT_MSG"
    git push

    if [ $? -eq 0 ]; then
        echo -e "${GREEN}✓ 推送成功${NC}"
    else
        echo -e "${RED}✗ 推送失败${NC}"
        exit 1
    fi
fi

# 完成
echo -e "\n${GREEN}========================================${NC}"
echo -e "${GREEN}✓ 博客发布完成！${NC}"
echo -e "${GREEN}========================================${NC}"
echo -e "\n访问: ${BLUE}https://leviduan.github.io/${NC}"
echo -e "等待 1-2 分钟后生效\n"



