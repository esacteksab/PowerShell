##Creates a Qtree.  Creates a LUN in previously created Qtree.  Maps previously created LUN to next Descending LUN ID.  
$ErrorActionPreference = "silentlycontinue"
Import-Module DataOnTap
################ CHANGE THESE #####################
$Filer = '192.168.0.51' #IP Address of Filer.  You can also use HOSTNAME.
$UserName = 'root' #Username with sufficient rights on Filer
$Password = ConvertTo-SecureString "netapp" -AsPlainText -Force #Password for Filer
$Volume = '/vol/esx_cluster/' #Volume to create Qtree In
$FilerCredential = New-Object -TypeName System.Management.Automation.PSCredential -ArgumentList $UserName,$Password
$InitiatorGroup = 'esx_cluster' #Initiator Group to Map LUN to
###################################################

###Do a Few Checks to Ensure above paths/variables are correct/exist###

##Get Volume defined Above
$DoesVolumeExist = Get-Navol $Volume 
if ($DoesVolumeExist) {Write-Host -ForegroundColor "Yellow" "Volume Exists.  Proceed"}
Else {Write-Host -ForegroundColor "Red" "Volume Doesn't Exists.  Try Again" $_
	break
	}

##Get Inititiator Group
$DoesInitiatorExist = Get-NaIgroup $InitiatorGroup
if ($DoesInitiatorExist) {Write-Host -ForegroundColor "Yellow" "Initiator Group Exists.  Proceed"}
Else  {Write-Host -ForegroundColor "Red" "Initiator Group Doesn't Exist.  Try Again" $_
	break
	}


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
Else {Write-Host "Proceed"




##Get New Qtree Name
$NewQtree = Read-Host "Please Enter Qtree Name" #Name of new Qtree

##Check to make sure Qtree name does not already exist
$DoesQtreeExist = Get-NaQtree $Volume$NewQtree

##If Qtree exists, tell me and quit.
if ($DoesQtreeExist) {Write-Host -ForegroundColor "Red" "Qtree Already Exists" $_
	break
	}

##If Qtree doesn't exist, create New Qtree
Else { New-NaQtree $Volume$NewQtree
	}

##Get New LUN Name
$NewLUN = Read-Host "Please Enter LUN Name" #Name of new LUN

##Check to see if New Lun Exists
$DoesLUNExist = Get-NaLun $Volume$NewQtree/$NewLUN

##If LUN Exists, tell me and quit.
if ($DoesLUNExist) {Write-Host -ForegroundColor "Red" "LUN Already Exists" $_
	break
	}
	
#If LUN Doesn't Exist, Create it.
else {

#$NewLUNSize = Read-Host "Enter Size for New LUN.  M for MB, G for GB, T for TB. (i.e: 15M, 30G, 2T)" #Enter size of new LUN
New-NaLun $Volume$NewQtree/$NewLUN -Size $ProposedLUNSize -type vmware

	}
	
##Set Description of LUN
$NewLUNDescription = Read-Host "Description for new LUN" #Description for New LUN
Set-NaLunComment $Volume$NewQtree/$NewLUN $NewLUNDescription

##Map New LUN
$NewLUNMapID = (Get-NaIgroup -name $InitiatorGroup | ForEach-Object {$_.Initiators} | Get-NaLunMapByInitiator | sort LunID | Where-Object { $_.LUNID -ne 0 } |  Select-Object -ExpandProperty LUNID -First 1) -1
Add-NaLunMap $Volume$NewQtree/$NewLUN $InitiatorGroup -ID $NewLUNMapID

	}

Write-Host -ForegroundColor "Yellow" "A Qtree was created with a path of $Volume$NewQtree"
Write-Host -ForegroundColor "Yellow" "A $ProposedLUNSize LUN was created with a path of $Volume$NewQtree/$NewLUN and was mapped to Inititator Group '$InitiatorGroup' with LUNID $NewLUNMapID"

