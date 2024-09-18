#!/bin/bash

if [ -e "lock.dat" ]; then 
    rm -f "lock.dat"  # 使用 -f 选项忽略文件不存在的错误
    # 短时暂停
    sleep 0.1
else
    # 读取s
    s=$(<"$1")
    # s++
    let s=s+1
    # 更新共享信号量s
    echo $s > $1
fi

