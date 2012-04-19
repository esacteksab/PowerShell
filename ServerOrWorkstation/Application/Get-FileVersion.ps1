$Servers = get-content servers.txt | 
    ForEach-Object $_ {[system.diagnostics.fileversioninfo]::GetVersionInfo("C:\windows\system32\notepad.exe")} | 
        Select-Object -ExpandProperty ProductVersion 
        
            if ($Servers -eq "6.1.7600.16385") 
                {Write-Host "$Servers","True"}
            
            Else {Write-Host "False"}