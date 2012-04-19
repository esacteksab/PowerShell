## Get Computers from computer-list.txt
$computers = get-content computer-list.txt

##Loop through computers in computer-list.txt
foreach ($computer in $computers) {

## Write the computer name
Write-Host $computer

## Display the properties of the latest 5 event logs in the application event logs.  
Get-EventLog application -ComputerName $computer -Newest 5 | fl -Property * 

}
