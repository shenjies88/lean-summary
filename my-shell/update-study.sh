#!/bin/bash
cd ~/Desktop/summary
read -p "请输入提交信息: " MSG
git add .
git commit -m "$MSG"
git push origin master
