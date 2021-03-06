<# 
   .Synopsis 
        Get's the Average Run Time of a Command 
   .Description
        Get's the Average Run Time of a Command
   .Parameter Count 
        Define number of times to run command, will default to 5 if no option is given
   .Parameter Script
        Define Script to run, will run 'Start-Sleep 5' if not command is entered
   .Example 1
        Get-AverageRunTime.ps1 
        
        Average time of 5 runs of Start-Sleep 5 is 4999.8988 milliseconds
        --Get's the Average run time of 'Start-Sleep 5' ran 5 times
   .Example 2
        Get-AverageRunTime.ps1 -Count 7
        
        Average time of 7 runs of Start-Sleep 5 is 4999.84081428572 milliseconds
        --Get's the Average run time of 'Start-Sleep 5' ran 7 times
   .Example 3
        Get-AverageRunTime.ps1 -Script .\event10-test.ps1
        
        Average time of 5 runs of .\event10-test.ps1 is 5002.18004 milliseconds
        --Get's the Average run time of '.\Event10-Test.ps1' ran 5 times
   .Example 4
        Get-AverageRunTime.ps1 -count 7 -Script .\event10-test.ps1
        
        Average time of 7 runs of .\event10-test.ps1 is 5001.71274285714 milliseconds
        --Get's the Average run time of '.\Event10-Test.ps1' ran 7 times
   
    NAME: Get-AverageRunTime.ps1 
    AUTHOR: Barry Morrison 
    LASTEDIT: 04/17/2011 19:44:33 
     
#> 

param(
    [string]$Count = 5,
    $Script = "Start-Sleep 5"
    )
    
$ScriptBlock = $ExecutionContext.InvokeCommand.NewScriptBlock($Script)

$Average = (@(1..$Count | %{ Measure-Command $ScriptBlock } | Select-Object -ExpandProperty TotalMilliseconds ) | Measure-Object -average).Average


    

Write-Host "Average time of $Count runs of $Script is $Average milliseconds"