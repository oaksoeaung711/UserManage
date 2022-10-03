$groups = Import-Csv ..\informations\groups.csv

#Creating Folders
foreach ($g in $groups) {
    mkdir ..\lists\$($g.displayName)
    
    Get-TeamUser -GroupId $g.groupId -Role Owner |Export-Csv ..\lists\$($g.displayName)\$($($g.displayName)+"owner"+".csv")
    Get-TeamUser -GroupId $g.groupId -Role Member |Export-Csv ..\lists\$($g.displayName)\$($($g.displayName)+"member"+".csv")
}