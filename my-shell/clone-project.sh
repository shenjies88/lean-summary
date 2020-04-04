#!/bin/bash
WORK_PROJECT="~/Desktop/work/project"
read -p "输入项目地址:" URL
cd `echo ${WORK_PROJECT}`
git clone $URL
