$installedDrivers = Get-WmiObject -computer moomachine -Query "Select * from Win32_PrinterDriver where Name like 'canon%PCL5%'"

if($?){
  if($installedDrivers){
    Write-Host "$installedDrivers"
  } else {
    Write-Host "No Canon PCL drivers"
  }
} else {
   Write-Host "Couldn't Get-WMIObject from moomachine"
}