$Constant = 55555
$Test_number
Write-Host "The constant is $Constant "

$Round = [int]1
while($Round -le 5 )
{
    Write-Host "This is round $Round "
    $Test_number = Read-Host "Input a test number "

    if ($Test_number -le $Constant) {
        Write-Host "$Test_number is less or equal to $Constant"
    }else {
        Write-Host "$Test_number is greater than $Constant"
    }

    $Round ++
}