$FilePath = (Get-ChildItem -Path c:,d: -Filter 'Cisco' -Recurse -ErrorAction SilentlyContinue)

$FilePath.FullName