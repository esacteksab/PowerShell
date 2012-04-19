###########################################################################
#
# NAME: Get-ProcessPrivateBuild.ps1
#
# AUTHOR:  Barry Morrison
#
# COMMENT: Determine if a process is a PrivateBuild
#
# VERSION HISTORY:
# 1.0 4/4/2011 - Initial release
#
###########################################################################
$Application = Read-Host "Enter Process Name"
$Computers=Get-Content servers.txt


foreach ($Computer in $Computers){

    $Path=Get-Process $Application | Select-Object -first 1 -ExpandProperty Path 

            $isPrivateBuild=[system.diagnostics.fileversioninfo]::GetVersionInfo("$Path") | Select-Object -ExpandProperty IsPrivateBuild 
            
                Write-Host "$Application,$Computer,$IsPrivateBuild"

    }