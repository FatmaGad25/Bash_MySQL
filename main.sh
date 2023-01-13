PS3="Enter a number: "
x=5
y=5

select op in add_user del_user add_db del_db exit
do
if [[ $op == add_user ]]
then 
	. create_user.sh
fi
if [[ $op == del_user ]]
then 
	. delete_user.sh
fi
if [[ $op == add_db ]]
then 
	. create_db.sh
fi
if [[ $op == del_db ]]
then 
	. del_db.sh
fi
if [[ $op == exit ]]
then 
	exit
fi
done
