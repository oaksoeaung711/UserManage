$groups = Import-Csv ..\informations\groups.csv


foreach ($g in $groups) {
    $deleteUser = Import-Csv ..\lists\$($g.displayName)\$($($g.displayName)+"owner"+".csv")
    foreach ($d in $deleteUser) {
        if ($d.User -ne "meetingorganizer.kbtc.edu.mm" -and $d.User -ne "oaksoeaung@skipbox.me"){
            Remove-TeamUser -GroupId $g.groupId -User $d.User
        }

    }
}

foreach ($g in $groups) {
    $deleteUser = Import-Csv ..\lists\$($g.displayName)\$($($g.displayName)+"member"+".csv")
    foreach ($d in $deleteUser) {
        Remove-TeamUser -GroupId $g.groupId -User $d.User
    }
}