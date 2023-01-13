current=$(whoami)
isexist=$(cat DB_admins.db | grep -w $current | wc -l)
if [[ $isexist -eq 1 ]]
then
	echo Please, enter the user you want to delete from ADMINS!
	read delname
	isexist=$(cat DB_admins.db | grep -w $delname | wc -l)
	if [[ $isexist -eq 1 ]]
	then
		echo $(sed -i /$delname/d DB_admins.db)
		echo $delname was deleted successfully.
	else
		echo This user is not an admin already!
	fi
	
else
    echo "You're ($(whoami)) not an admin and don't have that privilage"
fi
echo "---------------------------------------"
echo
PS3="Please, Choose an option: "
return