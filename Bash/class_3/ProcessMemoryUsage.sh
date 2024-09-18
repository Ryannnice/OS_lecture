filename="process.txt"
echo "Reading $filename"
linecounter=0
while read -r line; do
	line="$line"
	let linecounter+=1
	
	if [ $linecounter -gt 7 ]; then
		column=0
		memsize=""

		for word in $line; do
			if [ $column -eq 9 ]; then
				memsize=$word
				break;
			fi
			let column+=1
		done

		if [ $memsize != "0.0" ]; then
			echo $line 
		fi
	fi
done < $filename

