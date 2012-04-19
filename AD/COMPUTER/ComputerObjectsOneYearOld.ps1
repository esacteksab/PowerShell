#set date to be used as the limit ex. 365 days

$old = (Get-Date).AddDays(-365)

#get the list of computers with the date earlier than this date

Get-QADComputer -IncludedProperties pwdLastSet -Sizelimit 0 | where { $_.pwdLastSet -le $old } | Format-Table DN > one_year_old.txt