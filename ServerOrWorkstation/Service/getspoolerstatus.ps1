#server.txt -- computer name
Get-WmiObject win32_service -comp (gc server.txt) -Filter "name like '%spooler%'" | Format-List State

#Force -- If dependancy exists.  Must be ran with elevated privelelages.  ***ONLY WORKS LOCALLY***
Get-Service | Where-Object {$_.DisplayName -like '*Spooler'} #| Stop-Service -Force

#Stop Service REMOTELY
(Get-WmiObject -ComputerName printsrv2-dev Win32_service -Filter "Name='spooler'").StopService()

Get-Service | Where-Object {$_.DisplayName -like '*Spooler'} | FT DisplayName, Status