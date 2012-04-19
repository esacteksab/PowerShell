##Display Available Free Space on Volume
$AvailableVolumeSpace = (Get-NaVol esx_cluster | Select-Object -ExpandProperty SizeAvailable)
Write-Host -ForegroundColor "Yellow" "$AvailableVolumeSpace KB Available on Volume"
$ProposedLUNSize = Read-Host "How Big of a LUN Do you want to Create?"
 
$lunSize = $ProposedLUNSize -replace '[MKGT]B?$'
if($lunSize -ne $ProposedLUNSize) {
        switch -regex ($ProposedLUNSize -replace '\d+') {
        'KB?' { $lunSize = [int]$lunSize * 1KB }
        'MB?' { $lunSize = [int]$lunSize * 1MB }
        'GB?' { $lunSize = [int]$lunSize * 1GB }
		'TB?' { $lunSize = [int]$lunSize * 1TB }
        }
}
if ($AvailableVolumeSpace -lt $LUNSize) {Write-Host "Not Enough Space"}
Else {Write-Host "Proceed"}