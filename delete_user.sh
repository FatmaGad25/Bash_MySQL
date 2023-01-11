if grep -Fxq "$(whoami)" DB_admins.db
then
	echo "mawgood"
	echo Please, enter the user you want to add as an ADMIN!
	read delname
	if grep -Fxq "$delname" DB_admins.db
	then

		$"sed -i '/$delname/d' DB_admins.db"
		echo $delname was deleted successfully.
	else
		echo This user is not an admin already!
		echo $delname
		#echo "sed -i /$delname/d DB_admins.db"
		echo $(grep -Fxq "$delname" DB_admins.db)
	fi
	
else
    echo "You're ($(whoami)) not an admin and don't have that privilage"
fi

