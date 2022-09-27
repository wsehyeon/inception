if [ !/var/www/wordpress/wp-config.php ]
then
	mkdir -p /var/www/wordpress
	wp core download --allow-root --version=6.0.2 --path='/var/www/wordpress'
	chown -R www-data:www-data /var/www/wordpress

	wp config create --allow-root --dbname=$WP_DB_NAME \
								--dbuser=$WP_DB_ADMIN_USER \
								--dbpass=$WP_DB_ADMIN_PASS \
								--dbhost=mariadb:3306 \
								--path='/var/www/wordpress'

	wp core install --allow-root --url=$DOMAIN_NAME \
								--title=$WP_TITLE \
								--admin_user=$WP_ADMIN_USER \
								--admin_password=$WP_ADMIN_PASS \
								--admin_email=$WP_ADMIN_EMAIL \
								--path='/var/www/wordpress'

	wp user create --allow-root $WP_USER_NAME $WP_USER_MAIL --user_pass=$WP_USER_PASS --role=author --path='/var/www/wordpress'
fi

/usr/sbin/php-fpm7.3 -F