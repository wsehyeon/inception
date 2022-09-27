mkdir -p /var/www/html
wp core download --allow-root --version=6.0.2 --path='/var/www/html'
chown -R www-data:www-data /var/www/html
	
wp core install --allow-root --url=$DOMAIN_NAME\
								--title=$WP_TITLE\
								--admin_user=$WP_ADMIN_USER\
								--admin_password=$WP_ADMIN_PASS\
								--admin_email=$WP_ADMIN_EMAIL\
								--path='/var/www/html'

wp user create --allow-root $WP_USER_NAME $WP_USER_MAIL --user_pass=$WP_USER_PASS --role=author --path='/var/www/html'

/usr/sbin/php-fpm7.3 -F