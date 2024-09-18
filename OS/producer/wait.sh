#!/bin/bash

# 从文件中读取 s 的值，如果文件为空或不存在，设置默认值为0
s=$(<"$1")
if [ -z "$s" ]; then
  s=0
fi

if [ $s -gt 0 ]; then
  let s=s-1
  echo $s > $1
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


