#!/bin/sh
#For new raspberry pi
#install os first
#Installation of the following
# Appache2
# PHP7
# SSH enabeled

#COLORS
# Reset
Color_Off='\033[0m'       # Text Reset

# Regular Colors
Red='\033[0;31m'          # Red
Green='\033[0;32m'        # Green
Yellow='\033[0;33m'       # Yellow
Purple='\033[0;35m'       # Purple
Cyan='\033[0;36m'         # Cyan

echo "$Green Get ready to install all the LAMP stuf in one shot!"
echo "$Red Enter your admin password."
read ROOT_PASS



echo -e "$Red Hi there! $Green This is a great success! $Color_Off"

sudo apt-get update -y && sudo apt-get upgrade -y
sudo apt-get install apache2 -y
sudo apt-get install php libapache2-mod-php -y


sudo apt-get install mysql-server -y
sudo apt-get install php-mysql -y
sudo apt-get install php-gd -y
sudo apt-get install php-imagick -y
sudo chown -R www-data:www-data /var/www
sudo apt-get install phpmyadmin -y
sudo a2enmod rewrite
echo "phpmyadmin phpmyadmin/dbconfig-install boolean true" | debconf-set-selections
echo "phpmyadmin phpmyadmin/app-password-confirm password $ROOT_PASS" | debconf-set-selections
echo "phpmyadmin phpmyadmin/mysql/admin-pass password $ROOT_PASS" | debconf-set-selections
echo "phpmyadmin phpmyadmin/mysql/app-pass password $ROOT_PASS" | debconf-set-selections
echo "phpmyadmin phpmyadmin/reconfigure-webserver multiselect apache2" | debconf-set-selections

apt-get install -y phpmyadmin

sudo service apache2 restart
sudo systemctl enable ssh
sudo systemctl start ssh
