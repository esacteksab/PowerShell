Get-WmObject win32_perfrawdata_perfOS_memory | Select-Object -ExpandProperty AvailableMBytes

$AvailableMB = Get-WmiObject win32_perfrawdata_perfOS_memory | Select-Object -ExpandProperty AvailableMBytes 

"{0:N0} MB" -f $AvailableMB