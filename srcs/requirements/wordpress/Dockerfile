FROM debian:buster

RUN apt-get -y update
RUN apt-get -y upgrade

# debian:buster not support php7.4
# php7.4 ~> debian:bullseye
RUN apt-get -y install php7.3
RUN apt-get -y install php-fpm
RUN apt-get -y install php-mysql

# https://make.wordpress.org/cli/handbook/guides/installing/#installing-on-windows 
# -O option :    resource name : last URL word
RUN apt-get -y install curl
RUN curl -O https://raw.github.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod -x wp-cil.phar
RUN mv wp-cli.phar /usr/local/bin/wp

COPY ./conf/www.conf /etc/php/7.3/pool.d/www.conf
COPY ./tools/wp-script.sh /wp-script/sh

# 파일 실행권한 체크
CMD ./wp-script.sh

RUN mkdir -p /run/php

# foreground
ENTRYPOINT ["php-fpm7.3", "-F"]