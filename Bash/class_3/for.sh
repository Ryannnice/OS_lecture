#!/bin/bash

for num in `seq 1 10`; do
	cube1=`expr $num "*" $num "*" $num`
	let cube2=$num*$num*$num
	echo $num      $cube1      $cube2
done

echo "Program terminated ..."
