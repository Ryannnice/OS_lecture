#!/bin/bash

# 初始化信号量
# mutex = 0：未上锁 mutex = 1：上锁
echo "0" > "mutex.txt"
# 初始空间为 10
echo "5" > "space.txt"
# buffer中，初始数据个数为0
echo "0" > "data.txt"


# 三个生产者程序：
./producer.sh &  #producer NO.1 
./producer.sh &  #Producer NO.2
./producer.sh &  #Producer NO.3
# 两个消费者程序：
./consumer.sh &  #Consumer NO.1
./consumer.sh &  #Consumer NO.2

# 打印，标志着初始化程序成功运行！
echo "Initialization Programme terminated ! "
