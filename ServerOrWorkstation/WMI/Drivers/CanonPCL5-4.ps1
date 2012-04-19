foreach ($computer in gc computer-list.txt) {
  Get-WmiObject -computer $computer -Query "Select * from Win32_PrinterDriver where Name like 'canon%PCL5%'" 2>&1 | Foreach-Object {$content = $false} {
    if ($_ -is [System.Management.Automation.ErrorRecord]) {
      $content = $true
      Write-Host "Couldn't Get-WMIObject from $computer."
    } elseif ($_) {
      $content = $true
      Write-Host "$installedDrivers"
    }
  } {if (-not $content) {Write-Host "No Canon PCL drivers on $computer."}}
}