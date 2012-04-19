function Get-24hEventLogEntries {
param(
[String]
[ValidateSet('System','Application')]
$LogName='System',

[String]
[ValidateSet('Error','Warning','Information')]
$EntryType='Error'
)

Get-EventLog -LogName $LogName -EntryType $EntryType -After ((Get-Date).AddDays(-1))

}