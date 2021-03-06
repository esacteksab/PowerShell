## Creates 20110417.log file
$fileName = "{0:yyyyMMdd}.log" -f(Get-Date)

## Tests to see if File exists
$FileExists = Test-Path $Filename

    ## If file exists
    If ($FileExists -eq "True"){
    
    ## Tell user file exists, prompt for text to append to filename
        $AppendText = Read-Host "File Exists, please enter text to append to filename"
    
        ## Append a -Text to filename
        $NewFilename = "{0:yyyyMMdd}-$AppendText.log" -f(Get-Date)
        Get-Process | Out-File $NewFilename
        }
    ## If file doesn't exists
    Else {
        ## Write Filename
        Get-Process | Out-File $Filename
        }
        
        