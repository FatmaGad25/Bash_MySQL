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
		read -p "enter DB name " db_name
		mkdir -p ./Databases/$db_name 
		echo "dir created"
		echo $current >> ./Databases/$db_name/owner.txt
	fi

done
