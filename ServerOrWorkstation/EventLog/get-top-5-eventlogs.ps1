$computers = get-content computer-list.txt

foreach ($computer) {
Write-Host $computer
Get-EventLog application -ComputerName $computer -Newest 5

}