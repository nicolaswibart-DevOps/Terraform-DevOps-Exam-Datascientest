#!/bin/bash
set -e

# Logs pour debug
exec > >(tee /var/log/user-data.log) 2>&1

apt-get update -y
apt-get install -y apache2 php php-mysql libapache2-mod-php curl unzip

systemctl enable apache2
systemctl start apache2

cd /tmp
curl -LO https://wordpress.org/latest.zip
unzip -o latest.zip
rm -rf /var/www/html/*
cp -R wordpress/* /var/www/html/

chown -R www-data:www-data /var/www/html/
chmod -R 755 /var/www/html/

systemctl restart apache2