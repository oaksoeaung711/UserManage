$foldername = @()
$displayname = Import-Csv ../information/allgroup.csv |ForEach-Object {$_.displayName}
$foldername += $displayname

For($d=0;$d -lt $foldername.Length;$d++){
    mkdir ../lists/$($foldername[$d])
}

For($d=0;$d -lt $foldername.Length;$d++){
    touch ../lists/$($foldername[$d])/$($foldername[$d])"(newMember).csv"
    touch ../lists/$($foldername[$d])/$($foldername[$d])"(newOwner).csv"
}

# $grouparr = @()
# $group = Import-Csv ./information/allgroup.csv |ForEach-Object {$_.id}
# $grouparr += $group

# $filegroup = @()
# For($g=0;$g -lt $grouparr.Length;$g++){
#     $filegroup += $foldername[$g]+"group"+".csv"
# }


# function addingnewusers {
#     $newMember = @()
#     For($f=0;$f -lt $grouparr.Length;$f++){
#         $newMember += $foldername[$f]+"(newMember)"+".csv"
#     }
    
#     $newOwner = @()
#     For($f=0;$f -lt $grouparr.Length;$f++){
#         $newOwner += $foldername[$f]+"(newOwner)"+".csv"
#     }
      
#     For($z = 0;$z -lt $foldername.Length;$z++){
#         $memberonlyarr = @()
#         $memberonly = Import-Csv ./lists/$($foldername[$z])/$($newMember[$z]) |ForEach-Object {$_.User}
#         $memberonlyarr += $memberonly
        
#         $owneronlyarr = @()
#         $owneronly = Import-Csv ./lists/$($foldername[$z])/$($newOwner[$z]) |ForEach-Object {$_.User}
#         $owneronlyarr += $owneronly

#         $grouponlyarr = @()
#         $grouponly = Import-Csv ./lists/$($foldername[$z])/$($filegroup[$z]) |ForEach-Object {$_.GroupId}
#         $grouponlyarr += $grouponly

#         $mcount = 0
#         $ocount = 0

#         if ($memberonlyarr.Length -ne 0) {
#             For($v = 0;$v -lt $grouponlyarr.Length;$v++){
#                 For($u = 0; $u -lt $memberonlyarr.Length;$u++){
#                     Add-TeamUser -Role Member -GroupId $grouponlyarr[$v] -User $memberonlyarr[$u]
#                     $mcount++
#                 }
#                 "$mcount members added to $($foldername[$z])"
#                 $mcount = 0
#             }  
#         } else {
#             "There is no member to add in $($foldername[$z])."
#         }

#         if ($owneronlyarr.Length -ne 0) {
#             For($v = 0;$v -lt $grouponlyarr.Length;$v++){
#                 For($u = 0; $u -lt $owneronlyarr.Length;$u++){
#                     Add-TeamUser -Role Owner -GroupId $grouponlyarr[$v] -User $owneronlyarr[$u]
#                     $ocount++
#                 }
#                 "$ocount members added to $($foldername[$z])"
#                 $ocount = 0
#             }
#         } else {
#             "There is no owner to add in $($foldername[$z])."
#         } 
#     }
# }

# function removeusers {
#     $member = @()
#     For($f=0;$f -lt $grouparr.Length;$f++){
#         $member += $foldername[$f]+"member"+".csv"
#     }

#     $owner = @()
#     For($o=0;$o -lt $grouparr.Length;$o++){
#         $owner += $foldername[$o]+"owner"+".csv"
#     }

#     For($z = 0;$z -lt $foldername.Length;$z++){
#         $memberonlyarr = @()
#         $memberonly = Import-Csv ./lists/$($foldername[$z])/$($member[$z]) |ForEach-Object {$_.User}
#         $memberonlyarr += $memberonly
    
#         $owneronlyarr = @()
#         $owneronly = Import-Csv ./lists/$($foldername[$z])/$($owner[$z]) |ForEach-Object {$_.User}
#         $owneronlyarr += $owneronly
    
#         $grouponlyarr = @()
#         $grouponly = Import-Csv ./lists/$($foldername[$z])/$($filegroup[$z]) |ForEach-Object {$_.GroupId}
#         $grouponlyarr += $grouponly
    
#         "-----Removing Member and Owner in $($foldername[$z])-----"
    
#         For($v = 0;$v -lt $grouponlyarr.Length;$v++){
#             For($u = 0; $u -lt $memberonlyarr.Length;$u++){
#                 Remove-TeamUser -GroupId $grouponlyarr[$v] -User $memberonlyarr[$u]
#                 "Member $($memberonlyarr[$u]) has been removed from $($foldername[$z])"
#             }
#         }
    
#         For($v = 0;$v -lt $grouponlyarr.Length;$v++){
#             For($u = 0; $u -lt $owneronlyarr.Length;$u++){
#                 if ($owneronlyarr[$u] -ne "meetingorganizer@kbtc.edu.mm" -and $owneronlyarr[$u] -ne "toelwinmyint@skipbox.me") {
#                     Remove-TeamUser -GroupId $grouponlyarr[$v] -User $owneronlyarr[$u]
#                     "Owner $($owneronlyarr[$u]) has been removed from $($foldername[$z])"
#                 } else {
#                     "$($owneronlyarr[$u]) is remained as owner"
#                 }
#             }
#         }
#     }
# }

# function updateuserlist {
#     For($gp=0;$gp -lt $grouparr.Length;$gp++){
#         Get-Team -GroupId $grouparr[$gp] |Export-Csv ./lists/$($foldername[$gp])/$($filegroup[$gp])
#     }
    
#     $memberfile = @()
#     For($f=0;$f -lt $grouparr.Length;$f++){
#         $memberfile += $foldername[$f]+"member"+".csv"
#     }
    
#     $ownerfile = @()
#     For($o=0;$o -lt $grouparr.Length;$o++){
#         $ownerfile += $foldername[$o]+"owner"+".csv"
#     }
    
#     For($u=0;$u -lt $grouparr.Length;$u++){
#         Get-TeamUser -GroupId $grouparr[$u] -Role Member |Export-Csv ./lists/$($foldername[$u])/$($memberfile[$u])
#     }
    
#     For($k=0;$k -lt $grouparr.Length;$k++){
#         Get-TeamUser -GroupId $grouparr[$k] -Role Owner |Export-Csv ./lists/$($foldername[$k])/$($ownerfile[$k])
#     }
# }

# $con = $true
# while ($con) {
#     $userinput = Read-Host "`n1. Update Users' List `n2. Add Different Users to Different Groups `n3. Add Same Users to Different Groups `n4. Remove Users `n0. Exit `n"

#     if ($userinput -eq 1) {
#         updateuserlist
#     } elseif ($userinput -eq 2) {
#         addingnewusers
#     } elseif ($userinput -eq 3) {
#         "This is 3"
#     } elseif ($userinput -eq 4) {
#         removeusers
#     } elseif ($userinput -eq 0) {
#         $con = $false
#     } else {
#         "`n~~~Invalid Input~~~"
#     }
# }
