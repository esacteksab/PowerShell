Import-CSV tldid.csv | foreach  { Get-QADUser -LdapFilter "(tldID=$($_.tldid))" } | Select DN > DN-From-tldID.csv
