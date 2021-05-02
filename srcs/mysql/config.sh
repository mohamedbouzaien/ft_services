#!/bin/sh
sed -i 's/skip-networking/#skip-networking/g' /etc/my.cnf.d/mariadb-server.cnf
/usr/bin/mysql_install_db --user=root --datadir="/var/lib/mysql"
/usr/bin/mysqld_safe --user=root --datadir="/var/lib/mysql" & sleep 5
echo "CREATE DATABASE wordpress;" | mysql -u root
echo "CREATE USER 'root'@'%' IDENTIFIED BY 'admin'; GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' WITH GRANT OPTION; USE wordpress; FLUSH PRIVILEGES;" | mysql -u root
telegraf & sleep infinite