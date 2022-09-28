FROM debian:buster

RUN apt-get update -y && apt-get upgrade -y
RUN apt-get install mariadb-server -y

# RUN chown -R mysql:mysql /var/lib/mysql

COPY ./conf/my.cnf /etc/mysql/my.cnf
COPY ./tools/mariadb-setting.sh /
COPY ./tools/wp_backup.sql /

ENTRYPOINT ["sh", "./mariadb-setting.sh"]