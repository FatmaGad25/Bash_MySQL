current=$(whoami)
users_admins=$(awk '{print $1}' DB_admins.db)
echo $current 
echo "-------"
echo $users_admins

for i in $users_admins
do 
	if [[ $current == $i ]] 
	then
		echo "has access"
		echo "Databases available"
		ls ./Databases 
		read -p "enter DB name to be deleted  " db_name
		if [[ $current == $(cat ./Databases/$db_name/owner.txt) ]] 
		then	
			echo "has access"
			rm -r ./Databases/$db_name 
			echo "db deleted successfully"
		fi
	fi

done
