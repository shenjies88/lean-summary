#!/bin/bash
read -p "请输入提交信息: " MSG
cd `dirname $0`
cp ~/.zshrc ./.zshrc
cd ${SHELL_DIR}
git add .
git commit -m "$MSG"
git push origin master
