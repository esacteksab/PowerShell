
$installedDrivers = Get-WmiObject -computer moomachine -Query "Select * from Win32_PrinterDriver where Name like 'canon%PCL5%'"

if($installedDrivers){Write-Host "$installedDrivers"}
else {Write-Host "All System's are a Go!"}