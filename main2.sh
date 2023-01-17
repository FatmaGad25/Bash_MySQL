PS3="Please, Choose an option: "
select option in $(cat ./options.txt) exit
do
if [[ $option == exit ]]
then 
	return
else
	. $option
fi
done
