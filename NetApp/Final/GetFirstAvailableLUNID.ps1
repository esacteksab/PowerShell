$a = Get-NaIgroup | ForEach-Object {$_.Initiators} | Get-NaLunMapByInitiator | sort LunID | Where-Object { $_.LUNID -ne 0 } |  Select-Object -ExpandProperty LUNID -First 1
$b = ($a - 1)