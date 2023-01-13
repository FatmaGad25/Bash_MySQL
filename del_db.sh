current=$(whoami)
isexist=$(cat DB_admins.db | grep -w $current | wc -l)
if [[ $isexist -eq 1 ]]
then
	echo "Available Databases: "
	ls ./Databases 
	read -p "enter DB name to be deleted  " db_name
	if [[ $current == $(cat ./Databases/$db_name/owner.txt) ]] 
	then	
		rm -r ./Databases/$db_name 
		echo "Database Deleted Successfully"
	fi
fi
echo "---------------------------------------"
echo
PS3="Please, Choose an option: "
return