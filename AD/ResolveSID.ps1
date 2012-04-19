$username = $env:username
$objUser = New-Object System.Security.Principal.NTAccount($username)
$UserSID = $objUser.Translate([System.Security.Principal.SecurityIdentifier]).Value