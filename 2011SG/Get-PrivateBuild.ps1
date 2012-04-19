$Application = Read-Host "Enter Process Name"
$Path=Get-Process $Application | Select-Object -Property * | Select-Object -first 1 -ExpandProperty Path 

$path

[system.diagnostics.fileversioninfo]::GetVersionInfo("$Path") | Select-Object -Property * -ExpandProperty IsPrivateBuild 