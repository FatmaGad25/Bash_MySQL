current=$(whoami)
isexist=$(cat DB_admins.db | grep -w $current | wc -l)
if [[ $isexist -eq 1 ]]
then
	echo Please, enter the user you want to add as an ADMIN!
	read adname
	isexist=$(cat DB_admins.db | grep -w $adname | wc -l)
	if [[ $isexist -eq 1 ]]
	then
		echo This user is already an ADMIN!
	else
		echo $adname>> DB_admins.db
		echo $adname was added successfully as an ADMIN.
	fi
	
else
    echo "You're ($(whoami)) not an admin and don't have that privilage"
fi
echo "---------------------------------------"
echo
PS3="Please, Choose an option: "
return
