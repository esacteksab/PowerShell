$Drives= Get-WmiObject Win32_LogicalDisk -filter "DriveType=3" 

foreach ($drive in $Drives){

$DriveSize = "{0:##.#}GB" -f ($Drive.Size/1GB)
$FreeSpace = "{0:##.#}GB" -f ($Drive.FreeSpace/1GB)
$UsedSpace = ([Int64]$Drive.Size - [Int64]$Drive.FreeSpace)
$UsedSpaceGB = "{0:##.#}GB" -f ($UsedSpace/1GB)
$PercentUsed = ($UsedSpace/$DriveSize)
$PercentUsedFormatted = "{0:P0}" -f $PercentUsed


Write-Host "-------------"
Write-Host $Drive.SystemName
Write-host Drive Letter: $Drive.DeviceID
Write-host Drive Size: $DriveSize
Write-host Free Space: $FreeSpace
Write-Host Space Used: $UsedSpaceGB
Write-Host Percent Used: $PercentUsedFormatted
if ($PercentUsedFormatted -gt 80) {Write-Host -ForegroundColor Red "Not Enough Free Space Available"}
Else {Write-Host -ForegroundColor Green "Enough Free Space Available"}


}