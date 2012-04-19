Get-Service | where-object {$_.DisplayName -like 'Enterprise*'} | stop-service

start-sleep -seconds 120

Get-Service | where-object {$_.DisplayName -like 'Enterprise*'} | start-service