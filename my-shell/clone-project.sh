#!/bin/bash
read -p "输入项目地址:" URL
cd ${WORK_PROJECT}
git clone $URL
