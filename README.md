# Dump Docker DB
This makes it easy to dump a MySQL database that is running in a Docker
container.

# To Use
- Save the file to your computer.
- Using the Terminal, make it executable:
    - `chmod u+x dump-docker-db.sh`
- From the terminal, run the command
    - `./dump-docker-db.sh container_name database_name database_password [filename.sql]`
    - "container_name" is the name of the Docker container. You can get the name
      by running `docker ps`
    - "database_name" is the name of the MySQL database to dump.
    - "database_password" is the root password for the MySQL running in the
      container.
    - "filename.sql" is optional. By default it will create a filename with the
      date and seconds since Epoch.

- Alternatively, you can use a '.env' file to hold the arguments. In this case
  all fields are required to be in the '.env' file.
    - The .env file should look like this:
    ```
    DOCKER_CONTAINER_NAME=container_name
    MYSQL_ROOT_PASSWORD=rootPassword
    MYSQL_DATABASE=db_name
    DB_FILENAME=filename.sql
    ```
    - in this case, run the command by itself
    - `./dump-docker-db.sh`
