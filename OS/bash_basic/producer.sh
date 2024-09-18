#!/bin/bash

alphabet=( $(echo {A..Z}) )
buffer=(${alphabet[@]})
buffsize=${#buffer[@]}
counter=0

while [ $counter -lt $buffsize ]; do
  ./wait.sh space.txt
  ./wait.sh free.txt
  
  item_produced=${buffer[$counter]}
  buffer=$(< "buffer.txt")
  echo "$buffer$item_produced" > buffer.txt
  
  let counter=counter+1
  echo "Item Produced=$item_produced"
  
  ./signal.sh free.txt
  ./signal.sh data.txt
done

echo "Production completed!"

