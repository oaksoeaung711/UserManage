!!Before using this folder you must do following steps!!

1. "allgroup.csv" နှင့် "groupfolders.csv" တွင် မဖြစ်မနေ manage လုပ်မည့် group information များထည့်ပေးရမည်
2. "allgroup.csv" တွင် "id" နေရာတွင် Group ID ထည့်ပေးရမည် "DisplayName" နေရာတွင် Group Display Name ထည့်ပေးရမည်
3. "groupfolders.csv" တွင် "Name" နေရာတွင် Group Display Name ထည့်ပေးရမည်

Adding new users to groups

1. Run "exporting_user.ps1"
2. "lists" folder အောက်တွင် "newMember.csv" နှင့်ဆုံးသည့် file တွင် အသစ်ထည့်မည့် new MEMBER users များ ထည့်ပေးရမည်
3. "lists" folder အောက်တွင် "newOwner.csv" နှင့်ဆုံးသည့် file တွင် အသစ်ထည့်မည့် new Owner users များ ထည့်ပေးရမည်
4. Run "adduser.ps1"
5. "exporting_user.ps1" ကိုပြန် run ပေးရမည် နောက်ဆုံးထည့်ထားတဲ့ users များရဲ့ lists update ဖြစ်နေရန်အတွက်

Exporting users

1. Run "exporting_user.ps1"

Removing users

1. "exporting_user.ps1" ကို run ရမည် update ဖြစ်နေရန်အတွက်
2. Run "removeuser.ps1"

"check.ps1" ကို run ခြင်းဖြင့် group အားလုံးတွင်ရှိသည့် member နှင့် owner များကိုစစ်နိုင်သည်