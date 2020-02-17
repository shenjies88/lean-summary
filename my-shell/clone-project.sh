#!/bin/bash
read -p "输入项目地址:" URL
if [ ! -d '~/Desktop/work/project' ];then
    mkdir ~/Desktop/work/project
fi
cd ~/Desktop/work/project
git clone $URL
