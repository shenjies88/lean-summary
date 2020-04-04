#!/bin/bash
read -p "请输入提交信息: " MSG
cd `dirname $0`
cp ~/.zshrc ./.zshrc
if [ $? -ne 0 ]; then
echo "复制.zshrc成功"
fi
cd ${SHELL_DIR}
git add .
git commit -m "$MSG"
git push origin master
