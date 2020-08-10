# Dump Docker DB
This makes it easy to dump a MySQL database that is running in a Docker
container.

# To Use
- Save the file to your computer.
- Using the Terminal, make it executable:
    - `chmod u+x dump-docker-db.sh`
- From the terminal, run the command
    - `./dump-docker-db.sh container_name database_user database_password database_name [filename.sql]`
    - "container_name" is the name of the Docker container. You can get the name
      by running `docker ps`
    - "database_user" is the user name of the MySQL account.
    - "database_password" is the password for the MySQL user account running in the
      container.
    - "database_name" is the name of the MySQL database to dump.
    - "filename.sql" is optional. By default it will create a filename with the
      date and seconds since Epoch.

- Alternatively, you can use a '.env' file to hold the arguments. In this case
  all fields are required (except the `DB_FILENAME` field) to be in the '.env' file.
    - If the `DB_FILENAME` option is not in the .env file, then the program
      generates the file name based on the date and the seconds since the
      Epoch.
    - The .env file should look like this:
    ```
    DOCKER_CONTAINER_NAME=container_name
    MYSQL_USER=mysqlUser
    MYSQL_PASSWORD=mysqlPassword
    MYSQL_DATABASE=db_name
    DB_FILENAME=filename.sql
    ```
    - in this case, run the command by itself
    - `./dump-docker-db.sh`
