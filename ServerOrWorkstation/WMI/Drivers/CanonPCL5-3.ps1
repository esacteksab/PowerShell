#Don't Display Error Messages (Don't display RPC Server Unavailable / Access Denied / etc.)
$ErrorActionPreference = "silentlycontinue"

#Get Content for each computer in computer-list.txt  Computer-list.txt has one computer name per line.
foreach ($computer in gc computer-list.txt) {
#Get Installed Drivers with name like canon and PCL5 -- You can change keywords to fit your needs.
 	$installedDrivers = Get-WmiObject -computer $computer -Query "Select * from Win32_PrinterDriver where Name like 'canon%PCL5%'"

  if($?){
#If Drivers are installed, print driver name
    if($installedDrivers){
      Write-Host "$installedDrivers"
	  #If no drivers exist, tell me.  
    } else {
      Write-Host "No Canon PCL drivers on $computer"
    }
	#If unable to Query WMIObject, tell me so I can troubleshoot instead of assuming driver doesn't exist.  
  } else {
     Write-Host "Couldn't Get-WMIObject from $computer"
  }
}