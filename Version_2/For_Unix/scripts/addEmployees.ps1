$staff = Import-Csv ../informations/employeesList.csv
$groups = Import-Csv ../informations/groups.csv
$allclass = @('kg','p-1','p-2','p-3','p-4','p-5','p-6','s-1','s-2','s-3')
$lowerclass = @('kg','p-1','p-2')
$upperclass = @('p-3','p-4','p-5','p-6','s-1','s-2','s-3')
$PMIT = @()
$DK12 = @()
$D34 = @() 
$D56 = @()
$DS123 = @()
$lowerstaff = @()
$upperstaff = @()

function addUser{
    Param (
        $allgroup,
        $class,
        $people,
        $role
    )
    foreach ($g in $allgroup) {
        if ($g.displayName.ToLower().Contains($class)) {
            foreach ($p in $people) {
                Add-TeamUser -Role $role -GroupId $g.groupId -User $p
            }
        }
    }
}

foreach ($x in $staff) {
    if (
        ($x.ROLE.ToLower().Contains("principal")) -or
        ($x.ROLE.ToLower().Contains("pa")) -or
        ($x.ROLE.ToLower().Contains("activity")) -or
        ($x.ROLE.ToLower().Contains("manager")) -or
        ($x.ROLE.ToLower().Contains("it"))
    ){
        $PMIT += $x.EMAIL
    } elseif (
        ($x.ROLE.ToLower().Contains("p-1")) -or
        ($x.ROLE.ToLower().Contains("p-2")) -or
        ($x.ROLE.ToLower().Contains("kg"))
    ) {
        $DK12 += $x.EMAIL
    } elseif (
        ($x.ROLE.ToLower().Contains("p-3")) -or
        ($x.ROLE.ToLower().Contains("p-4"))
    ) {
        $D34 += $x.EMAIL
    } elseif (
        ($x.ROLE.ToLower().Contains("p-5")) -or
        ($x.ROLE.ToLower().Contains("p-6"))
    ) {
        $D56 += $x.EMAIL
    } elseif (
        ($x.ROLE.ToLower().Contains("s-1")) -or
        ($x.ROLE.ToLower().Contains("s-2")) -or
        ($x.ROLE.ToLower().Contains("s-3"))
    ) {
        $DS123 += $x.EMAIL
    } elseif (
        ($x.ROLE.ToLower().Contains("lower"))
    ) {
        $lowerstaff += $x.EMAIL
    } elseif (
        ($x.ROLE.ToLower().Contains("upper"))
    ) {
        $upperstaff += $x.EMAIL
    }

}

foreach ($c in $allclass) {
    addUser -allgroup $groups -class $c -people $PMIT -role 'Owner'
}

addUser -allgroup $groups -class 'kg'  -people $DK12 -role 'Owner'
addUser -allgroup $groups -class 'p-1'  -people $DK12 -role 'Owner'
addUser -allgroup $groups -class 'p-2'  -people $DK12 -role 'Owner'
addUser -allgroup $groups -class 'p-3'  -people $D34 -role 'Owner'
addUser -allgroup $groups -class 'p-4'  -people $D34 -role 'Owner'
addUser -allgroup $groups -class 'p-5' -people $D56 -role 'Owner'
addUser -allgroup $groups -class 'p-6' -people $D56 -role 'Owner'
addUser -allgroup $groups -class 's-1' -people $DS123 -role 'Owner'
addUser -allgroup $groups -class 's-2' -people $DS123 -role 'Owner'
addUser -allgroup $groups -class 's-3' -people $DS123 -role 'Owner'

foreach ($l in $lowerclass) {
    addUser -allgroup $groups -class $l -people $lowerstaff -role "Member"
}

foreach ($u in $upperclass) {
    addUser -allgroup $groups -class $u -people $upperstaff -role "Member"
}
