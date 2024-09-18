# 挖掘布朗语料库：
declare -A hashmap

for file in brown/*[0-3]; do # 本程序为方便快捷，只挖掘0-3结尾文件
	echo "Reading $file"
	sed 's_\([^ ]*\)/[^ ]*_\1_g' $file > t1.txt
	sed "s/'//g" t1.txt > t2.txt
	sed "s/\`//g" t2.txt > t3.txt
	sed "s/\[//g" t3.txt > t4.txt
	sed "s/\]//g" t4.txt > t5.txt
	sed "s/\\$//g" t5.txt > t6.txt
	while read -r line; do
		line="$line"
		if [ ${#line} -gt 0 ]; then
			#echo $line 
			for word in $line; do
				if [ ${#word} -gt 0 ]; then
				    #echo ${word}
					if [ ${hashmap[${word}]+_} ]; then
						let hashmap[$word]=$((hashmap[${word}]+1))
					else
						let hashmap[$word]=1
					fi
				fi
			done
		fi
	done < "t6.txt"
	#break
done

# 开始peoducer进程：
# 用关联数组 hashmap 中所有“键”(i) 作为循环变量 :
for i in "${!hashmap[@]}"; do
    echo $i ${hashmap[$i]}
  
    ./wait.sh space.txt
    ./wait.sh free.txt
  
    # 临界区：
    # /////////////////////////////////////////////////////////////////////
    item = ${${hashmap[$i]}}
    echo -e "\n$item" >> buffer.txt
    # echo "Item Produced=$item"
    printf "\n Producer NO.%d Produced : $item \n" $(( $$ % 3 + 1 ))
    # /////////////////////////////////////////////////////////////////////
   
    ./signal.sh free.txt
    ./signal.sh data.txt
   
    
    # print : 
    printf "***After produced '$data' *** \n Buffer:%s \n space:%s \n data:%s\n\n " "$(<buffer.txt)" "$(<space.txt)" "$(<data.txt)"
    
done
