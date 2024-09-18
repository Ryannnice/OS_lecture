#!/bin/bash
#free
echo 1 > free.txt
#space
echo 5 > space.txt
#data
echo 0 > data.txt
#创建缓冲区
rm -f buffer.txt
touch buffer.txt
rm -f lock.dat
#运行生产者消费者进程
(./producer.sh &) 
(./consumer.sh &)

