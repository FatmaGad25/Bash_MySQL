# Bash_MySQL
| Name              | Track        |
|-------------------|--------------|
| Aliaa Adel        | Data Science |
| Fatma Hussain Gad | Data Science |

> This projects simulates some SQL functionalities like creating and deleteing admins, databases, and tables or manipulating data with insert, select, and delete rows. In this report we'll explain the functionality and made assumptions for each requirements. 


## 1. Create User:
1. Checks if the current user is an admin signed in **DB_admins.db file** or the script will output **You're not an admin and don't have that privilage** won't be able to add new admins. 
2. After checking the current user is signed as an admin, the script asks for the username to be signed as an admin and checks it wasn't already added as an admin before then add it to the **DB_admins.db file** or else it will output the user is **already added**. 


## 2. Delete User:
Same as create user with the same checks and validations but instead of adding the user to the **DB_admins.db file** it deletes it. 

## 3. Create Database:
1. Only admins in **DB_admins.db file** can create databases or it will output **You're not an admin and don't have that privilage**. 
2. Databases are created under Databases directory and each has a file containing the owner user to restrict the access to the database. 
3. The script checks that no database was created with the same name before or else it will output **This database already exists** and won't create anything. 

## 4. Delete Database: 
1. Same checks and validations, checks for the current user and whether the Database exist or not and if not, it outputs **Database Not Found**. 
2. Additionally, only the owner of the database can delete it.  
3. Also, the script lists all available databases for the user.

## 5. Create Table:
- Restriction:
  * To Be a signed admin in **DB_admins.db** as an admin
  * To Be the owner of the database you're creating the table in.
  * Table name wasn't created before

- Functionality: 
  * Lists the available databases
  * Checks the owner
  * Asks for table name and number of columns
  * Checks for table name and asks for the columns names
  * Create a .table file with the column names separed with a comma. 

## 6. Insert Row:
- Restriction:
  * To Be a signed admin in **DB_admins.db** as an admin
  * To Be the owner of the database you're creating the table in.
  * To not violate the primary key (checks for duplicate values)

- Functionality: 
  * Lists the available database
  * If you're the owner, lists the tables in the database you chose 
  * Asks for the value of each column Successively 
  * If the PK is duplicated, outputs (Duplicated PK) and won't insert the record
  * If not duplicated takes each column separetly and records the row comma-separated.
