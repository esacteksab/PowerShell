$servers = Get-Content servers.txt ## Get a List of Servers
	foreach ($server in $servers) {
		Get-WinEvent -ListLog * -ComputerName $server | ## Get ETL on each server defined in $Servers
			Where-object {$_.IsEnabled -eq "true"} | ## Only get Enabled ETL's
				Select-object -property LogName, FileSize, IsClassicLog, LastWriteTime | ## Only want LogName, FileSize, IsClassicLog and LastWriteTime
					Sort-Object -Descending -Property LastWriteTime | ## Sort by LastWriteTime
						Out-GridView ## Put it in a pretty output, that's sortable
					
	}