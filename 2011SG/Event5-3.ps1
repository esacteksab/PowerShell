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




function Get-BasicInfo {
param(
[Parameter(Mandatory=$true)]
$ComputerName
)
$OSName = Get-WmiObject @WMIQuery -ComputerName $ComputerName | Select-Object -ExpandProperty Caption
}

Get-BasicInfo

$OSName