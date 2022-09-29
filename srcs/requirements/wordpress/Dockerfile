FROM debian:buster

RUN apt-get -y update
RUN apt-get -y upgrade

# debian:buster not support php7.4
# php7.4 ~> debian:bullseye
RUN apt-get -y install php7.3
RUN apt-get -y install php-mysql
RUN apt-get -y install php-fpm
RUN apt-get -y install mariadb-client

RUN apt-get -y install wget
RUN apt-get -y install unzip

# download wordpress && mv /var/www/ && chown(nginx access)
RUN wget https://ko.wordpress.org/latest-ko_KR.zip
RUN unzip latest-ko_KR.zip -d /var/www/
RUN chown -R www-data:www-data /var/www/wordpress

# mv config files
RUN rm -rf /var/www/wordpress/wp-config-sample.php
COPY ./conf/wp-config.php /var/www/wordpress/
COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d/

RUN mkdir -p /run/php

ENTRYPOINT ["php-fpm7.3", "-F", "-R"]
