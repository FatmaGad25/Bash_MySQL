current=$(whoami)
isexist=$(cat DB_admins.db | grep -w $current | wc -l)
if [[ $isexist -eq 1 ]]
then
	echo "Available Databases: "
	ls ./Databases/ 
	read -p "Enter The Name Of Database to be deleted: " db_name

	output=$(ls ./Databases | grep -w $db_name | wc -l)
	if [[ $output -eq 1 ]]
	then
		if [[ $current == $(cat ./Databases/$db_name/owner.txt) ]] 
		then	
			rm -r ./Databases/$db_name 
			echo "Database Deleted Successfully"
		else
			echo "You're not the owner of this Database and don't have that privilage" 
		fi
	else 
		echo Database Not Found
	fi
else
    echo "You're ($(whoami)) not an admin and don't have that privilage"
fi
echo "---------------------------------------"
echo
PS3="Please, Choose an option: "
return
