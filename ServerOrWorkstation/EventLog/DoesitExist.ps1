$evtID = Read-Host "Enter Event ID to Search For"
$countEvtID = (Get-EventLog -LogName System | where {$_.EventID -eq $evtID}).count

#Get-EventLog -LogName System | where {$_.EventID -eq $evtID}

if ($countEvtID -gt 0){write-host "We're Fucked.  That Event ID Exists!"}
else{Write-Host "Whew!  I thought we were a goner or a second!" }




