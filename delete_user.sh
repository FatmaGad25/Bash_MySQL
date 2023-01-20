current=$(whoami)
isexist=$(cat DB_admins.db | grep -w $current | wc -l)
if [[ $isexist -eq 1 ]]
then
	echo "Signed Admins: "
	cat DB_admins.db 
	echo ----------------------------
	read -p "enter Admin name to be deleted: " delname
	if [[ $delname == 'oracle' ]]
	then
		echo "Oracle Admin can't be deleted"
	else
		isexist=$(cat DB_admins.db | grep -w $delname | wc -l)
		if [[ $isexist -eq 1 ]]
		then
			# echo $(sed -i /$delname/d DB_admins.db)
			sed -i "/\b\($delname\)\b/d" DB_admins.db
			echo $delname was deleted successfully.
		else
			echo This user is not an admin already!
		fi
	fi
	
else
    echo "You're ($(whoami)) not an admin and don't have that privilage"
fi
echo "---------------------------------------"
echo
PS3="Please, Choose an option: "
return