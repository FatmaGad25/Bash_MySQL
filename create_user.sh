if grep -Fxq "$(whoami)" DB_admins.db
then
	echo "mawgood"
	echo "grep -Fxq "$(whoami)" DB_admins.db"
	echo Please, enter the user you want to add as an ADMIN!
	read adname
	if grep -Fxq "$adname" DB_admins.db
	then
		echo This user is already an ADMIN!
		#sed -i "/$adname/d" DB_admins.db
	else
		echo $adname  >> DB_admins.db
		echo $adname was added successfully as an ADMIN.
	fi
	
else
    echo "You're ($(whoami)) not an admin and don't have that privilage"
fi

