$Application = Read-Host "Enter Process Name"
$Path=Get-Process $Application | Select-Object -Property * | Select-Object -first 1 -ExpandProperty Path 


    $IsPrivateBuild=[system.diagnostics.fileversioninfo]::GetVersionInfo("$Path")
        
      
"PrivateBuild:{0}" -f $IsPrivateBuild.PrivateBuild