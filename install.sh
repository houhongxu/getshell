#! /usr/bin/env bash
echo '<======开始安装======>'

# 定义变量 WORKSPACE，值为用户目录下的 workspace
WORKSPACE="$HOME/workspace"

# 定义变量 BIN_DIR workspace/bin
BIN_DIR="$WORKSPACE/bin"

# 定义变量 SHELL_DIR，值为 BIN_DIR 变量的值 /shell
SHELL_DIR="$BIN_DIR/shell"

# 如果 BIN_DIR 不存在则创建该目录
[[ ! -e $BIN_DIR ]] && mkdir -p $BIN_DIR

# 切换到 BIN_DIR 目录
cd $BIN_DIR || exit 1

# 如果 SHELL_DIR 是目录
if [[ -d $SHELL_DIR  ]]
then
  # 切换到 SHELL_DIR
  cd $SHELL_DIR || exit 1

  # 切换到 git 的 main 分支
  git checkout main

  # 从远程拉取最新的代码
  git pull
else
  # clone 代码
  git clone https://github.com/houhongxu/shell.git

  # 切换到 SHELL_DIR
  cd $SHELL_DIR || exit 1
fi

exit_in_error() {
  # 删除 SHELL_DIR
	rm -rf $SHELL_DIR

  # 删除 BIN_DIR
	rm -rf $BIN_DIR

	exit 1
}

# 添加 ~/workspace/bin/shell/bin 到 $PATH 环境变量
write_path(){
  # 定义变量 SHELL_CONFIG
  local SHELL_CONFIG=""
}