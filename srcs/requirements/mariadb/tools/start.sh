#!/bin/bash
if [ ! -d /var/lib/mysql/${MYSQL_DB_NAME} ];
then
	mysql_install_db --user=root --ldata=/var/lib/mysql

	mysqld&
	sleep 2

	#echo "CREATE DATABASE IF NOT EXISTS ${MYSQL_DB_NAME};"
	mariadb -u root -e "CREATE DATABASE IF NOT EXISTS ${MYSQL_DB_NAME};"

	#echo "CREATE USER '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_USER_PASSWORD}';"
	mariadb -u root -e "CREATE USER '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_USER_PASSWORD}';"

	#echo "GRANT ALL PRIVILEGES ON ${MYSQL_DB_NAME}.* TO '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';"
	mariadb -u root -e "GRANT ALL PRIVILEGES ON ${MYSQL_DB_NAME}.* TO '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';"

	#echo "SET PASSWORD FOR 'root'@'localhost'=PASSWORD('$(MYSQL_ROOT_PASSWORD}');"
	mariadb -u root -e "SET PASSWORD FOR 'root'@'localhost'=PASSWORD('${MYSQL_ROOT_PASSWORD}');"

	#echo "FLUSH PRIVILEGES;"
	mariadb -u root -e "FLUSH PRIVILEGES;"

	killall mysqld
fi

exec mysqld
