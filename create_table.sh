PS3="Please, Choose a Database: "
u=$(whoami)
isexist=$(cat DB_admins.db | grep -w $u | wc -l)
if [[ $isexist -eq 1 ]]
then
    # echo "Available Databases: "
    # ls ./Databases 
    select db in $(ls ./Databases) exit
    do
        if [[ $db == exit ]]
        then 
            echo "---------------------------------------"
            echo
            PS3="Please, Choose an option: "
            return
        else

            owner=$(cat ./Databases/$db/owner.txt)
            if [[ $owner == $u ]]
            then
                read -p "Enter table name " tbname
                isexist=$(ls ./Databases/$db/ | grep -w $tbname | wc -l)
                if [[ $isexist -eq 1 ]]
                then
                    echo "This table already exists in this database"
                else
                    touch ./Databases/$db/$tbname.table
                    read -p "Number of col " numofco
                    echo "Creating table $tbname with $numofco columns"
                    index=0
                    header=""
                    while [[ $index -lt $numofco ]]
                    do
                        index=$(($index+1))
                        read -p "Enter col name " cname
                        if [[ $index -eq $numofco ]]
                        then
                            header=$header$cname
                        else
                            header=$header$cname","
                        fi
                    done
                    echo $header>> ./Databases/$db/$tbname.table
                    echo "Table Created Successfully "
                    echo "---------------------------------------"
                    echo
                    PS3="Please, Choose an option: "
                    return
                fi
            fi
        fi
    done
else
echo "user doesn't exist"
fi