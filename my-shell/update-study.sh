#!/bin/bash
cd ~/Desktop/summary-practice
read -p "请输入提交信息: " MSG
cd `dirname $0`
cp ~/.zshrc ./.zshrc
git add .
git commit -m "$MSG"
git push origin master
