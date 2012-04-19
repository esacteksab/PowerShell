$DriveSize = (Get-WmiObject Win32_LogicalDisk -filter "DriveType=3" |Select-Object -ExpandProperty size)/1GB
$AvailableSpace = (Get-WmiObject Win32_LogicalDisk -filter "DriveType=3" |Select-Object -ExpandProperty FreeSpace)/1GB
$DriveLetter = Get-WmiObject Win32_LogicalDisk -filter "DriveType=3" |Select-Object -ExpandProperty DeviceID

$DriveSizeStripped = "{0:F0}" -f $DriveSize
$AvailableSpaceStripped = "{0:F0}" -f $AvailableSpace
$PercentAvailable = "{0:P0}" -f ($AvailableSpace/$DriveSize)

Write-Host "Drive: $DriveLetter"
Write-host "$DriveSizeStripped`GB Disk"
Write-host "$AvailableSpaceStripped`GB Available"
Write-host "$PercentAvailable Available"

if ($PercentAvailable -lt 20) {Write-Host -ForegroundColor Red "Not Enough Space."}
else {Write-Host -ForegroundColor Yellow "Enough Space"}