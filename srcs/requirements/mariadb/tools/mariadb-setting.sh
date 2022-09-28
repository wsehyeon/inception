service mysql start;

# wordpress 데이터 베이스 없으면 생성
mysql -e "CREATE DATABASE IF NOT EXISTS $DB_NAME";

# wordpress 데이터베이스 관리용 유저, 비번 생성
mysql -e "CREATE USER IF NOT EXISTS '$WP_ADMIN_USER'@'%' IDENTIFIED BY '$WP_ADMIN_PASS'";

# wordpress 데이터베이스 관리용 유저에게 권한 부여
mysql -e "GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$WP_ADMIN_USER'@'%'";

# wordpress 데이터 베이스에 워드프레스 백업파일 추기
mysql $DB_NAME -u root < ./wp_backup.sql

# mysql에 권한 설정
mysql -e "ALTER USER '$MYSQL_ROOT'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASS';"

# 권한 부여시 그냥 셧다운 안됨, 비번을 전달할 수있는 mysqladmin 키워드 사용
mysqladmin -u$MYSQL_ROOT -p$MYSQL_ROOT_PASS shutdown

exec mysqld