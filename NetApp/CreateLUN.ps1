##Creates a Qtree.  Creates a LUN in previously created Qtree.  Maps previously created LUN to next Descending LUN ID.  

Import-Module DataOnTap
################ CHANGE THESE #####################
$Filer = '192.168.0.51' #IP Address of Filer
$UserName = 'root' #Username with sufficient rights on Filer
$Password = ConvertTo-SecureString "netapp" -AsPlainText -Force #Password for Filer
$Volume = '/vol/esx_cluster/' #Volume to create Qtree In
$FilerCredential = New-Object -TypeName System.Management.Automation.PSCredential -ArgumentList $UserName,$Password
$InitiatorGroup = 'esx_cluster' #Initiator Group to Map LUN to
###################################################



##Connect to Filer with Credentials Specified Above
Connect-NaController $Filer -Credential $FilerCredential

##Create New Qtree
$NewQtree = Read-Host "Please Enter Qtree Name" #Name of new Qtree
New-NaQtree $Volume$NewQtree

##Display Available Free Space on Volume
$AvailableVolumeSpace = (Get-NaVol esx_cluster | Select-Object -ExpandProperty SizeAvailable)/1024
Write-Host -ForegroundColor "Yellow" "$AvailableVolumeSpace MB Available on Volume"

##Create New Lun
$NewLUN = Read-Host "Please Enter LUN Name" #Name of new LUN
$NewLUNSize = Read-Host "Enter Size for New LUN.  M for MB, G for GB, T for TB. (i.e: 15M, 30G, 2T)" #Enter size of new LUN
New-NaLun $Volume$NewQtree/$NewLUN -Size $NewLUNSize -type vmware

##Set Description of LUN
$NewLUNDescription = Read-Host "Description for new LUN" #Description for New LUN
Set-NaLunComment $Volume$NewQtree/$NewLUN $NewLUNDescription

##Map New LUN
$NewLUNMapID = (Get-NaIgroup -name $InitiatorGroup | ForEach-Object {$_.Initiators} | Get-NaLunMapByInitiator | sort LunID | Where-Object { $_.LUNID -ne 0 } |  Select-Object -ExpandProperty LUNID -First 1) -1
Add-NaLunMap $Volume$NewQtree/$NewLUN $InitiatorGroup -ID $NewLUNMapID