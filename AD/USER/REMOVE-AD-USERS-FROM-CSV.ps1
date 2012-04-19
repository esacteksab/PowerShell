#DN.csv -- 
#DN -- Header
#"DN=*" -- Full "DN" in quotes
Import-CSV DN.csv | foreach { Remove-QADObject -Identity $($_.DN) -Force}