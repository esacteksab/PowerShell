#I Need to search for "*MediaType" attribute/key in the registry, and I couldn't figure out how to escape the *.  So here is a Variable.  
$MediaType='*MediaType'

#Here I parse each entry in the hive/tree looking for *MediaType key
$RegKey = (Get-ChildItem "HKLM:\SYSTEM\CurrentControlSet\Control\Class\{4D36E972-E325-11CE-BFC1-08002BE10318}" -ErrorAction 0 | ForEach-Object {Get-ItemProperty $_.psPath -name $MediaType}) 

#MediaType = 16 = Wifi -- So I needed to find the Wifi Adapter and needed it's path to parse the Device Description
$RegistryPath = ($RegKey | Where-Object {$_.{*MediaType} -eq "16"}).PSPath

#The Device Description gives me a unique attribute between the registry and WMI.  
$DeviceDescription = (Get-ItemProperty -Name DriverDesc $RegistryPath | Select-Object -ExpandProperty DriverDesc)

#I query using WMI to find a network adapter with a name like what exists in the registry
$WifiCard = Get-WmiObject Win32_NetWorkAdapter | Where-Object {$_.name -like $DeviceDescription}

#Device ID is a unique ID that I can query WMI with to manage the wireless adapter.  
($wificard).DeviceID