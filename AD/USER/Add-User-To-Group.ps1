#faculty-temp = Group
#csv single column heading 'username'
#Use DN for multi-Domain / samAccountName for single Domain
Import-Csv c:\file.csv | foreach { ADD-QADGroupMember faculty-temp $($_.username)}

#faculty-temp = group
#bmorriso = user to add to group
ADD-QADGroupMember faculty-temp bmorriso
