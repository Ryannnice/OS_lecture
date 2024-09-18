#!/bin/bash
## 本程序停止当前生产者/消费者进程，并格式化各个记录文件
## 以便后续重启生产者/消费者进程

# 先停掉所有[生产者]和[消费者]的进程：
pkill -f producer
pkill -f consumer

# 初始化各个记录文件：
# “-f” ：在删除文件时，忽略文件不存在的错误
rm -f lock.dat
# 文本文件直接清空内容！
echo "" > "mutex.txt"
echo "" > "space.txt"
echo "" > "data.txt"
echo "" > "buffer.txt"

