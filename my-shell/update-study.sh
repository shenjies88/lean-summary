#!/bin/bash
read -p "请输入提交信息: " MSG
cd `dirname $0`
cp ~/.zshrc ./.zshrc
if [ $? -eq 0 ]; then
echo "复制.zshrc成功"
fi
cd `echo ${SHELL_DIR}`
git add .
git commit -m "$MSG"
git push origin master
