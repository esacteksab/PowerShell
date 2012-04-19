connect-QADService -service 'adam1.sub.tld.edu:50004'
Import-CSV ADAMDN.csv | foreach { Remove-QADObject -Identity $($_.DN) -Force}
