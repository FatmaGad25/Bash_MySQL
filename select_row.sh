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
                        PS3="Please, Choose an option: "
                        select opt in select_all search exit
                        do
                            if [[ $opt == exit ]]
                            then 
                                echo "---------------------------------------"
                                echo
                                PS3="Please, Choose an option: "
                                return
                            elif [[ $opt == select_all ]]
                            then
                                cat ./Databases/$db/$tbname
                            else
                                read -p "Please enter a search keyword: " keyword
                                grep -w $keyword ./Databases/$db/$tbname
                            fi
                        done
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