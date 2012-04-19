#list Event ID's comma separated in array
$evtIDs = (3,5,1074)

#Get Event ID's from System Log, if Event ID's exist and Format List to display properties of Event ID's
$evtIDProperties = Get-EventLog -LogName System | where {$evtIDs -contains $_.EventID} | fl -Property *

#Varialbe in the event a Event ID's don't exit.  
$noevtIDs = "No Event ID's exist"

#Count number of Event ID's in System Log
$countEvtID = (Get-EventLog -LogName System | where {$evtIDs -contains $_.EventID}).count

#conditional statement.  If Event ID(s) exist, write number of Event ID's and Event ID Properties
if ($countEvtID){$evtIDProperties}

#conditional statement.  If no Event ID(s) exist, tell me.  
else{ Write-host $noevtIDs}

