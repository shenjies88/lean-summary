#!/bin/bash
read -p "请输入端口号:" PORT
echo '该端口下的进程'
lsof -i:${PORT}
read -p "确定删除 输入y 取消输入n : " OPT
if [ "${OPT}" == "y" ]; then
        for i in `lsof -i:${PORT} | awk '{print $2}'`
        do
                expr ${i} + 0 &>/dev/null
                if [ $? -eq 0 ];then
                        echo "杀进程 ${i}"
                        kill -9 ${i}
                fi
                
        done
echo "执行命令 lsof -i:${PORT}"
lsof -i:${PORT}
else
        echo "取消操作"
        exit
fi
