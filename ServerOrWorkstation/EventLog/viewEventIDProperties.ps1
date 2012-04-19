#$log = Read-Host "Enter Windows Log to Parse"
#$evtID = Read-Host "Enter Event ID"
#$count = (Get-EventLog -LogName $log | where {$_.EventID -eq $evtID}).count
$index = Read-Host "Enter Index to View Event ID"
Get-EventLog -LogName $log | where {$_.index -eq $index} | fl -Property *