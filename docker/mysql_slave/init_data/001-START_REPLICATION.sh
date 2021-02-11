#!/bin/sh
until mysqladmin ping -h$MASTER_MYSQL_HOST -u$MASTER_MYSQL_USER -p$MASTER_MYSQL_PASSWORD --silent; do
    sleep 1
done

mysql -uroot -p$MYSQL_ROOT_PASSWORD -e" \
    CHANGE MASTER TO \
        MASTER_HOST = '$MASTER_MYSQL_HOST', \
        MASTER_PORT = 3306, \
        MASTER_USER = '$MASTER_MYSQL_USER', \
        MASTER_PASSWORD = '$MASTER_MYSQL_PASSWORD', \
        MASTER_AUTO_POSITION = 1; \
    START SLAVE; \
"
