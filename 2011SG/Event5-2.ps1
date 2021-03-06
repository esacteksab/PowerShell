$Date = Get-Date -format d

$Information = @"
$env:UserName
$env:ComputerName
$env:DomainName
$OSName

"User information collected on: $Date"
"@

$WMIQuery = @{
            'class'='Win32_OperatingSystem';
            'ErrorAction'='SilentlyContinue';
             }
             
        Foreach ($i in $args){
        
        $OSName = Get-WmiObject @WMIQuery -ComputerName $i | Select-Object -ExpandProperty Caption
        
        

$Information | Format-List | Out-File -FilePath info.txt -Encoding ASCII
        
        }