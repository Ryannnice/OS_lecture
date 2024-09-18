# 读取output.txt中的每一行单词并存储在数组中
output_file="output.txt"
mapfile -t buffer < "$output_file"
# 获取“buffer” 中元素的个数
buffsize=${#buffer[@]}
counter=0

while [ $counter -lt $buffsize ]; do
  ./wait.sh space.txt
  ./wait.sh free.txt
  
  item_produced=${buffer[$counter]}
  buffer_content=$(< "buffer.txt")
  echo "$buffer_content$item_produced" > buffer.txt
  echo "Item Produced=$item_produced"

  # 计数器+1, 以便选取下一行的数据：
  let counter=counter+1
  
  ./signal.sh free.txt
  ./signal.sh data.txt
done

echo "Production completed!"

# echo "\n Producer NO.$$ Produced : $data"
# printf "\n Producer NO.%d Produced : $data \n" $(( $$ % 3 + 1 ))

# print : 
# printf "***After produced '$data' *** \n Buffer:%s \n space:%s \n data:%s\n\n " "$(<buffer.txt)" "$(<space.txt)" "$(<data.txt)"
    