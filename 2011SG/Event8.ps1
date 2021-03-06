## Prompt user for path -- if no path is entered, it uses the directory the script exists in
$Path = Read-Host "Enter Path to a Directory"

## Prompt user for Directory / Filename for Output/CSV
$OutFile = Read-Host "Enter desired Filename of CSV file."

## Get all items in directory
Get-ChildItem -Path $Path | 

## Get Name, File Size, and Last Time Written
Select-Object -property name, length, lastwritetime | 

## Export to a CSV named event8.csv -- Do not declare .NET Object Type (cleans up CSV output)
Export-CSV -Path $OutFile -NoTypeInformation