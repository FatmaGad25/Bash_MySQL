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
                        read -p "Please enter a delete keyword: " keyword
                        # echo $(sed -i /$keyword/d ./Databases/$db/$tbname)
                        # if [[ $keyword -ne '' ]]
                        if [ -z "$keyword" ]
                        then
                            echo "Please, Enter a valid search keyword (Not an empty keyword)"
                            echo "---------------------------------------"
                            echo
                        else
                            echo
                            echo "Deleting any row containing the word ($keyword) ......" 
                            echo The updated table: 
                            echo
                            sed -i "/\b\($keyword\)\b/d" ./Databases/$db/$tbname
                            cat ./Databases/$db/$tbname
                            echo --------------------------
                        fi
                        
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
