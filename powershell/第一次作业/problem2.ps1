$num = (Read-Host "Input an integer")
#$num = [int](Read-Host "Input an integer")
$constant = 17

while ($num -le 100)
{
    $num += $constant
    Write-Host "After added the constant "$constant" , Current result $num"
}

Write-Host "The number is greater than 100 , interrupt ! "
