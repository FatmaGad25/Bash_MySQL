PS3="Please, Choose a Database: "
current=$(whoami)
isexist=$(cat DB_admins.db | grep -w $current | wc -l)
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
            if [[ $owner == $current ]]
            then
                select tbname in $(ls ./Databases/$db) exit
                do
                    if [[ $tbname == exit ]]
                    then 
                        echo "---------------------------------------"
                        echo
                        PS3="Please, Choose an option: "
                        return
                    else
                        record=""
                        numofco=$(awk -F, '{print NF; exit}' ./Databases/$db/$tbname)
                        echo $numofco
                        for index in $(seq 1 ${numofco})
                        do 
                            read -p "Enter col $index value: " value
                            if [[ index -eq 1 ]]
                            then
                                duplicate_val=$(cat ./Databases/$db/$tbname | awk -F, -v VAL=$value 'BEGIN {
                                            count=0;
                                        }
                                        {
                                        if ($1 == VAL){ 
                                            count = count +1;
                                            }
                                        
                                        }
                                        END {
                                            print count ;
                                        }'
                                        )
                                if [[ $duplicate_val -gt 0 ]]
                                then
                                    echo "Duplicate Primary Key value"
                                    return
                                fi
                            fi
                            if [[ $index -eq $numofco ]]
                            then
                                record=$record$value
                            else
                                record=$record$value","
                            fi
                        done
                        echo $record>> ./Databases/$db/$tbname
                        echo "Row was inserted Successfully "
                        echo "---------------------------------------"
                        echo
                        PS3="Please, Choose an option: "
                        return
                    fi
                done
            else 
                echo "You don't have access to this database"
            fi
        fi
    done        
else
    echo "You don't have that privilage"
fi
return