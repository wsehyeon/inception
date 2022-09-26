if [ !/var/www/wordpress/wp-config.php ]
then
	mkdir -p /var/www/wordpress
	wp core download --allow-root --version=6.0.2 --path=$WP_PATH
	chown -R www-data:www-data /var/www/wordpress

	wp config create --allow-root --dbname=$WP_DB_NAME\
								--dbuser=$WP_DB_ADMIN_NAME\
								--dbpass=$WP_DB_ADMIN_PASS\
								--dbhost=mariadb:3306\
								--path=$WP_PATH

	wp core install --allow-root --url=$DOMAIN_NAME\
								--title=$WP_TITLE\
								--admin_user=$WP_ADMIN_USER\
								--admin_password=$WP_ADMIN_PASS\
								--admin_email=$WP_ADMIN_EMAIL
								--path=$WP_PATH

	wp user create --allow-root $WP_USER_NAME $WP_USER_MAIL --user_pass=$WP_USER_PASS --role=author --path=$WP_PATH
fi