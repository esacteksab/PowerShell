$Test1 = Measure-Command {Start-Sleep 5}
$Test2 = Measure-Command {Start-Sleep 5}
$Test3 = Measure-Command {Start-Sleep 5}
$Test4 = Measure-Command {Start-Sleep 5}
$Test5 = Measure-Command {Start-Sleep 5}

$A = [int]$Test1.TotalMilliseconds
$B = [int]$Test2.TotalMilliseconds
$C = [int]$Test3.TotalMilliseconds
$D = [int]$Test4.TotalMilliseconds
$E = [int]$Test5.TotalMilliseconds

($A + $B + $C + $D + $E)/5