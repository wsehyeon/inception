service mysql start

sleep 5

if [ !/var/lib/mysql/$WP_DB_NAME ]
then
	mysql -e "CREATE DATABASE IF NOT EXISTS $WP_DB_NAME;"

	mysql -e "CREATE USER IF NOT EXISTS '$WP_DB_ADMIN_USER'@'%' IDENTIFIED BY '$WP_DB_ADMIN_PASS';"

	mysql -e "GRANT ALL ON $WP_DB_NAME.* TO '$WP_DB_ADMIN_USER'@'%';"

	mysql -e "ALTER USER '$WP_DB_ROOT'@'localhost' IDENTIFIED BY '$WP_DB_ROOT_PASS';"

	mysql -u$WP_DB_ROOT -p$WP_DB_ROOT_PASS -e "FLUSH PRIVILEGES;"

	mysqladmin -u$WP_DB_ROOT -p$WP_DB_ROOT_PASS shutdown

	sleep 5
fi

exec mysqld_safe

