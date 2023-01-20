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
            select tbname in $(ls ./Databases/$db/*.table | xargs -n 1 basename) exit
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
                            echo
                            cat ./Databases/$db/$tbname
                        else
                            read -p "Please enter a search keyword: " keyword
                            if [[ -z "$keyword" ]]
                            then
                                echo "Please, Enter a valid search keyword (Not an empty keyword)"
                            else
                                output=$(grep -w -i $keyword ./Databases/$db/$tbname | wc -l)
                                echo
                                if [[ output -gt 0 ]]
                                then
                                    grep -w -i $keyword ./Databases/$db/$tbname
                                else
                                    echo No rows selected
                                fi
                            fi
                        fi
                        echo "---------------------------------------"
                        echo
                        REPLY=
                    done
                fi
            done
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
