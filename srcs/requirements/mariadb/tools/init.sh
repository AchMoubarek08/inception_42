service mysql start;

mysql -uroot -e "CREATE DATABASE IF NOT EXISTS \`${DB_NAME}\`;"

mysql -uroot -e "CREATE USER IF NOT EXISTS \`${DB_USER}\`@'localhost' IDENTIFIED BY '${DB_PASSWORD}';"

mysql -uroot -e "GRANT ALL PRIVILEGES ON \`${DB_NAME}\`.* TO \`${DB_USER}\`@'%' IDENTIFIED BY '${DB_PASSWORD}';"


mysql -uroot -e "FLUSH PRIVILEGES;"
mysql -e "SET PASSWORD FOR root@localhost = PASSWORD('12345')"

sleep 3
mysqladmin -u root -p${MYSQL_ROOT_PASSWORD} shutdown

exec mysqld

