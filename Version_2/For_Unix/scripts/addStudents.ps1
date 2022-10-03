$students = Import-Csv ../informations/students.csv
$groups = Import-Csv ../informations/groups.csv


foreach ($g in $groups) {
    foreach ($s in $students) {
        if ($g.displayName.ToLower().Contains($s.CLASS.ToLower())) {
            Add-TeamUser -Role Member -GroupId $g.groupId -User $s.EMAIL
        }
        
    }
}