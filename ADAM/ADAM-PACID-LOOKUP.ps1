#pacid.csv -- 
#pacid -- header
#988number -- one per line
connect-QADService -service 'pacadam1.stk.pacific.edu:50004'
Import-CSV pacid.csv | foreach { get-QADObject -LdapFilter "(PACIFICID=$($_.pacid))"} | select DN > ADAMDN.csv