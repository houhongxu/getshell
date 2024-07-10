#! /usr/bin/env bash


# 定义变量 WORKSPACE，值为用户目录下的 workspace
WORKSPACE="$HOME/workspace"

# 定义变量 BIN_DIR workspace/bin
BIN_DIR="$WORKSPACE/bin"

# 删除文件夹
rm -rf $BIN_DIR
