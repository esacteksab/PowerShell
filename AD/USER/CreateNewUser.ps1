#Generic.CSV
#name,parentContainer,userPrincipalName,samAccountName,userPassword,Description
Import-CSV Generic.csv | foreach { new-QADUser -Name $_.name -ParentContainer $_.parentContainer -UserPrincipalName $_.userPrincipalName -samAccountName $_.samAccountName -userPassword $_.userPassword -Description $_.Description }

#Another way of doing it w/o CSV.  Sequentially create UserObjects.  Syntax is pretty self explanatory.  
1..500 | % { new-qaduser -parentcontainer 'OU=myOU,DC=myDomain,DC=COM' -name "MyTestUser$_" -samaccountname "MyTestUser$_" -UserPassword 'MyTestPassword' -email "MyTestUser$_@myDomain.com" }
