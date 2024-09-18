$num=1
do{
    $square=$num*$num
    echo "$num      $square"
    $num+=1
} until ($num -gt 50)
echo "Programme completed......"