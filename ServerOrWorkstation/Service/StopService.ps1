Get-Service | where-object {$_.DisplayName -like 'Enterprise*'} | stop-service

 invoke-command {get-service Search* | where {$_.status -eq 'running'} | stop-service -force} -computer SERVERA