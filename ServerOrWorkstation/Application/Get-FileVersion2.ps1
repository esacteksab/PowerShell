$Application = "C:\Windows\System32\notepad.exe"
$ProductVersion = "6.1.7600.16385"


    ForEach ($computer in Get-Content servers.txt) {
    
        $VersionExists = [system.diagnostics.fileversioninfo]::GetVersionInfo("$Application") | Select-Object -ExpandProperty ProductVersion
        
            if ($VersionExists -eq "$ProductVersion"){
                Write-Host "True"
                }
            
            
            Else {
                Write-Host "False"
                }
            
            }