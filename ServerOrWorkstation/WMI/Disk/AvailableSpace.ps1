$Disks = Get-WmiObject Win32_LogicalDisk -filter "DriveType=3" 

foreach ($disk in $Disks){
	$size = "{0:0.0}GB" -f ($disk.size/1GB)
	$FreeSpace = "{0:0.0}GB" -f ($disk.freespace/1GB)
	$used =([Int64]$disk.size - [Int64]$disk.freespace)
	$spaceused ="{0:0.0}GB" -f ($used/1GB)
	$percent = ($used)/($disk.size)
	$percent = "{0:P0}" -f $percent
	
	Write-Host $disk.systemname
	Write-Host $disk.deviceid
	Write-Host "Size : " $size
	Write-Host "Space Used :" $spaceused
	Write-Host "Free Space :" $FreeSpace
	Write-Host "Percentage Used :" $percent
	
	if ($percent -gt 80) {Write-Host -ForegroundColor Red "Not enough Space"}
	else {Write-Host -ForegroundColor Yellow "Enough Space"}
	
	}