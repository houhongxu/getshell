#! /usr/bin/env bash

echo "<======开始卸载======>"

# 定义变量 WORKSPACE，值为用户目录下的 workspace
WORKSPACE="$HOME/workspace"

# 定义变量 BIN_DIR workspace/bin
BIN_DIR="$WORKSPACE/bin"

# 定义变量 SHELL_DIR，值为 BIN_DIR 变量的值 /shell
SHELL_DIR=$BIN_DIR/shell

# 定义变量 ADD_TO_PATH 为 SHELL_DIR/bin
ADD_TO_PATH=$SHELL_DIR/bin

echo 删除文件夹 $BIN_DIR

# 删除文件夹
rm -rf $BIN_DIR

echo "<======卸载成功======>"