FROM debian:buster

RUN apt-get update -y && apt-get upgrade -y
RUN apt-get install mariadb-server -y

# COPY ./conf/my.cnf /etc/my.cnf
COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/

# 파일 실행권한 잘 체크하기
COPY ./tools/mariadb-setting.sh /

ENTRYPOINT ["sh", "./mariadb-setting.sh"]