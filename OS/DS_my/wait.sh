#!/bin/bash

s=$(<"$1")
# 检查变量 $s (即.txt文件)是否为空:
if [ -z "$s" ]; then
  s=0
fi

# 若信号量 >= 0 , 直接 -1 即可
if [ $s -gt 0 ]; then
  let s=s-1
  echo $s > $1
# 若信号量=0 , 先移除锁让步其他进程，再等待到锁消失，才能继续往下进行
else
  if [ -e "lock.dat" ]; then
    rm -f "lock.dat"  # 使用 -f 选项忽略文件不存在的错误
    sleep 0.1
  fi

  touch "lock.dat"
  while [ -e "lock.dat" ]; do
    sleep 0.1
  done
fi
