## List of Servers that exist in domain
$Servers = Get-Content Servers.txt


    
    
foreach ($Server in $Servers){
    ## Define parameters for Get-WmiObject
    $WMIQuery = @{
      class = 'Win32_Service'
      ComputerName = $Server
      ErrorAction = 'SilentlyContinue'
    }

    Get-WmiObject @WMIQuery  |
      Format-Table Name,Status 

    
}

## List of Servers that exist in domain
$Servers = Get-Content Servers.txt

## Define parameters for Get-WmiObject
$WMIQuery = @{
    'class'='Win32_Service';
    'ErrorAction'='SilentlyContinue';
    }
    
    
foreach ($Server in $Servers){
    Get-WmiObject @WMIQuery -ComputerName $Server |
    Format-Table Name,Status 

    
    }