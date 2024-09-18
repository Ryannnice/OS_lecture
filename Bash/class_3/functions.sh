#!/bin/bash

msg(){
	echo "Damn the Covid!"
}

loop(){
	for num in `seq 1 2 10`; do
		let cube=$num*$num*$num
		echo $num      $cube
	done
}

sum(){
	let sum=$1+$2
	return $sum
}

msg
loop
sum 10 10
echo "sum = $sum"

echo "Program terminated ..."
