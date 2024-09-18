#!/bin/bash

num=1
while [ $num -le 10 ]; do
	let square=$num*$num
	echo $num      $square
	let num=$num+1
done

echo "Program terminated ..."
