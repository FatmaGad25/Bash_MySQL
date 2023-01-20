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
                PS3="Please, Choose a table: "
                select tbname in $(ls ./Databases/$db/*.table | xargs -n 1 basename) exit
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
                        for index in $(seq 1 ${numofco})
                        do 
                            col=$(head -1 ./Databases/$db/$tbname | cut -d ',' -f$index)
                            read -p "Enter a value for column $col: " value
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
                                    echo "---------------------------------------"
                                    echo
                                    PS3="Please, Choose an option: "
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
                    REPLY=
                done
            else 
                echo "You don't have access to this database"
                echo "---------------------------------------"
                echo
            fi
        fi
        REPLY=
    done        
else
    echo "You don't have that privilage"
fi
echo "---------------------------------------"
echo
PS3="Please, Choose an option: "
return

