$Result = @(1..5 | %{ Measure-Command {Start-Sleep 5}} | Select-Object -ExpandProperty TotalMilliseconds )

$Average = ($Result[0]+$Result[1]+$Result[2]+$Result[3]+$Result[4])/5

Write-Host "Average time of 5 runs of 5 seconds is $Average milliseconds"
