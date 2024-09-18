#!/bin/bash

while [ -e "buffer.txt" ]; do

    ./wait.sh data.txt
    ./wait.sh mutex.txt

    # 临界区：
    # /////////////////////////////////////////////////////////////////////
    # 读取最后一行数据:
    item=$(tail -n 1 "buffer.txt")
    # 删除最后一行数据:
    sed -i '$d' 文件名.txt
    sleep 1
    printf "Consumer NO.%d Consumed : $item \n" $(( $$ % 2 + 1 ))
    # /////////////////////////////////////////////////////////////////////
    
    ./signal.sh mutex.txt
    ./signal.sh space.txt
    
    # print : 
    printf "**After consumed '$item' ** \n Buffer:%s \n space:%s \n data:%s\n " "$(<buffer.txt)" "$(<space.txt)" "$(<data.txt)"
    
    

done
