$Application=notepad

$VersionExists=[system.diagnostics.fileversioninfo]::GetVersionInfo("$Application").path

"PrivateBuild:{0}" -f $VersionExists.IsPrivateBuild