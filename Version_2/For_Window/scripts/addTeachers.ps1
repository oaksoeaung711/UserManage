$teachers = Import-Csv ..\informations\teachers.csv
$groups = Import-Csv ..\informations\groups.csv


foreach ($g in $groups) {
    foreach ($s in $teachers) {
        if ($g.displayName.ToLower().Contains($s.CLASS.ToLower())) {
            Add-TeamUser -Role Owner -GroupId $g.groupId -User $s.EMAIL
        }
    }
}