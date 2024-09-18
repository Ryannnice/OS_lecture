$daynum=read-host  # input a number
$daynum=[int]$daynum
switch($daynum)
{
    1 {$dayofweek='Monday'}
    2 {$dayofweek='Tuesday'}
    3 {$dayofweek='Wednesday'}
    4 {$dayofweek='Thursday'}
    5 {$dayofweek='Friday'}
    6 {$dayofweek='Saturday'}
    7 {$dayofweek='Sunday'}

    default {echo "no matches!"}
}

echo $dayofweek
echo "Programme completed......"