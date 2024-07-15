#! /usr/bin/env bash

echo '<======开始卸载======>'

# 定义变量 WORKSPACE，值为用户目录下的 workspace
WORKSPACE="$HOME/workspace"

# 定义变量 BIN_DIR workspace/bin
BIN_DIR="$WORKSPACE/bin"

echo '删除文件夹' $BIN_DIR

# 删除文件夹
rm -rf $BIN_DIR

echo '<======卸载成功======>'