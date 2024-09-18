function msg(){
    echo "Functions here......"
}

function loop(){
    for ($i=1; $i -le 10; $i++)
    {
        $square=$i*$i
        echo "$i      $square"
    }
}

function sum($vector){
    $sum=0
    for ($i=0; $i -lt $vector.Length; $i++){
        $sum+=$vector[$i]
    }
    return $sum
}

# use Founction :
msg
loop

$args=1,2,3,4,5
$z=sum($args)
echo "`nsum=$z"

echo "`nFunctions completed......"