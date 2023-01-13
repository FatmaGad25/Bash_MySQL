current=$(whoami)
isexist=$(cat DB_admins.db | grep -w $current | wc -l)
if [[ $isexist -eq 1 ]]
then
	# echo "has access"
	read -p "Enter DB name: " db_name
	mkdir -p ./Databases/$db_name 
	echo "Database Created Successfully "
	echo $current >> ./Databases/$db_name/owner.txt
fi
echo "---------------------------------------"
echo
PS3="Please, Choose an option: "
return