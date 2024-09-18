#!/bin/bash

# 若有锁，移除锁：
if [ -e "lock.dat" ]; then 
    rm -f "lock.dat"  
    sleep 0.1
# 若无锁，直接修改信号量即可
else
    s=$(<"$1")
    let s=s+1
    echo $s > $1
fi

