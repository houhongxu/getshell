#! /usr/bin/env bash

echo "<======开始安装======>"

# 定义变量 WORKSPACE，值为用户目录下的 workspace
WORKSPACE=$HOME/workspace

# 定义变量 BIN_DIR workspace/bin
BIN_DIR=$WORKSPACE/bin

# 定义变量 SHELL_DIR，值为 BIN_DIR 变量的值 /shell
SHELL_DIR=$BIN_DIR/shell

# 如果 BIN_DIR 不是目录则创建该目录
[[ ! -d $BIN_DIR ]] && mkdir -p $BIN_DIR

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

echo clone文件夹 $SHELL_DIR

exit_in_error() {
  # 删除 SHELL_DIR
	rm -rf $SHELL_DIR

  # 删除 BIN_DIR
	rm -rf $BIN_DIR

	exit 1
}

# 添加 ~/workspace/bin/shell/bin 到 $PATH 环境变量
add_path(){
  # 定义变量 SHELL_CONFIG
  local SHELL_CONFIG=

    # 如果 .zshrc 是文件
  if [[ -f $HOME/.zshrc ]]
  then
    # 将 .zshrc 路径 赋值给SHELL_CONFIG
    SHELL_CONFIG=$HOME/.zshrc

    echo 使用zsh
  else
    # 更新或者创建 .bashrc 文件
    touch $HOME/.bashrc

    # 将 .bashrc路径 设为文件路径
    SHELL_CONFIG=$HOME/.bashrc

    echo 使用bash
  fi

  # 定义变量 ADD_TO_PATH 为 SHELL_DIR/bin
  ADD_TO_PATH=$SHELL_DIR/bin

  # 如果 ADD_TO_PATH 的值没有在 SHELL_CONFIG 的文件中
  if(! grep $ADD_TO_PATH $SHELL_CONFIG 1>/dev/null)
  then
    echo 添加环境配置 $ADD_TO_PATH 到 $SHELL_CONFIG

    echo "# getshell 获取当前shell工具 环境变量" >> $SHELL_CONFIG
    echo export PATH=\$PATH:$ADD_TO_PATH >> $SHELL_CONFIG
    
    source $SHELL_CONFIG
  fi
}

# 尝试给 ./bin/* 下的所有文件添加可执行权限
(chmod +x ./bin/* && echo 给 $SHELL_DIR/bin 下所有文件添加可执行权限) || exit_in_error


if add_path
then 
  echo "<======安装成功======>"
else
  echo "<======安装失败======>"
  exit_in_error
fi
