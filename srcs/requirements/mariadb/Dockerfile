FROM debian:buster

RUN apt-get update -y && apt-get upgrade -y
RUN apt-get install mariadb-server -y

COPY ./conf/my.cnf /etc/my.cnf
COPY ./tools/mariadb-setting.sh /
COPY ./tools/wp_backup.sql /

ENTRYPOINT ["sh", "./mariadb-setting.sh"]