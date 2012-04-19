$Application = Read-Host "Enter Application Name Full Path (i.e C:\windows\system32\notepad.exe)"
$ProductVersion = Read-Host "Enter Application Version"


    ForEach ($computer in Get-Content servers.txt) {
    
        $VersionExists = [system.diagnostics.fileversioninfo]::GetVersionInfo("$Application") | Select-Object -ExpandProperty ProductVersion
        
            if ($VersionExists -eq "$ProductVersion"){
                Write-Host "True"
                }
            
            
            Else {
                Write-Host "False"
                }
            
            }