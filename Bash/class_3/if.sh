#!/bin/bash

answer="YES"
if [ $answer = "NO" ]; then
	echo "Running ..."
else
	echo "Denied ..."
fi

count=5
if [ $count -gt 10 ]; then
	echo "Count limit exceeded ..."
else
	echo "Count within limit ..."
fi

echo "Program terminated ..."
