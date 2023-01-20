current=$(whoami)
isexist=$(cat DB_admins.db | grep -w $current | wc -l)
if [[ $isexist -eq 1 ]]
then
	# echo "has access"
	read -p "Enter DB name: " db_name
	output=$(ls ./Databases | grep -w $db_name | wc -l)
	if [[ $output -eq 1 ]]
	then
		echo This database already exists
	else 
		mkdir -p ./Databases/$db_name 
		echo "Database Created Successfully "
		echo $current >> ./Databases/$db_name/owner.txt
	fi
else
    echo "You're ($(whoami)) not an admin and don't have that privilage"
fi
echo "---------------------------------------"
echo
PS3="Please, Choose an option: "
return
