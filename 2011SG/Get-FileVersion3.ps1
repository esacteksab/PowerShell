$Application=Read-Host "Enter the Application's Full Path (i.e C:\windows\system32\notepad.exe)"
#$ProductVersion=Read-Host "Enter Application Version (i.e 6.1.7600.16385)"


    ForEach ($computer in Get-Content servers.txt) {
    
        $VersionExists=[system.diagnostics.fileversioninfo]::GetVersionInfo("$Application") | Select-Object -ExpandProperty ProductVersion
        
            if ($VersionExists -like "6.1.7600.16385"){
                Write-Host "True", "$Computer"
                }
            
            
            Else {
                Write-Host "False"
                }
            
            }