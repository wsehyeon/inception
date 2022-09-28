service mysql start

# -e : 파일이 존재하면 참
# 근데 존재하지 않을 때만 실행
if [ ! -e /var/lib/mysql/$WP_DB_NAME ]
then
	mysql -e "CREATE DATABASE IF NOT EXISTS $DB_NAME;"

	mysql -e "CREATE USER IF NOT EXISTS '$WP_ADMIN_USER'@'%' IDENTIFIED BY '$WP_ADMIN_PASS';"

	mysql $DB_NAME -u root < /wp_backup.sql

	mysql -e "GRANT ALL ON $DB_NAME.* TO '$WP_ADMIN_USER'@'%';"

	mysql -e "ALTER USER '$MYSQL_ROOT'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASS';"

	mysqladmin -u$MYSQL_ROOT -p$MYSQL_ROOT_PASS shutdown
fi

exec mysqld

