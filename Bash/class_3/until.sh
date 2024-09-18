#!/bin/bash

num=1
until [ $num -gt 10 ]; do
	let cube=$num*$num*$num
	echo $num      $cube
	let num=$num+1
done

echo "Program terminated ..."
