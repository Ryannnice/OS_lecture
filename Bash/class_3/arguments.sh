#!/bin/bash

if [ $# -eq 0 ]; then
	echo "Usage: arguments.sh [arg1 ... arg5]"
elif [ $# -gt 6]; then
	echo "Too many arguments!"
	exit
fi

rm -r tempo
mkdir tempo
for file in $*; do
	cp $file tempo
	echo "$file archived!"
done

echo "Program terminated ..."
