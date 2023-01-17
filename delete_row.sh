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
                        read -p "Please enter a delete keyword: " keyword
                        # echo $(sed -i /$keyword/d ./Databases/$db/$tbname)
                        echo $keyword
                        # if [[ $keyword -ne '' ]]
                        if [ -z "$keyword" ]
                        then
                            echo "You entered an empty keyword"
                        else
                            sed -i "/\b\($keyword\)\b/d" ./Databases/$db/$tbname
                            cat ./Databases/$db/$tbname
                            echo --------------------------
                        fi
                        
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