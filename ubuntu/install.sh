#!/bin/bash

echo "--- Good morning, TeacherGraph. Let's get to work. Installing now. ---"

echo "--- Updating packages list ---"
sudo apt-get update

# echo "--- MySQL time ---"
sudo debconf-set-selections <<< "mysql-server mysql-server/root_password password root"
sudo debconf-set-selections <<< "mysql-server mysql-server/root_password_again password root"

echo "--- Installing base packages ---"
sudo apt-get install -y vim curl python-software-properties

echo "--- We want PHP 5.4, right TeacherGraph? ---"
sudo add-apt-repository -y ppa:ondrej/php5-oldstable

echo "--- Updating packages list ---"
sudo apt-get update

echo "--- Installing PHP-specific packages ---"
sudo apt-get install -y php5 apache2 libapache2-mod-php5 php5-curl php5-gd php5-mcrypt mysql-server-5.5 php5-mysql git-core

echo "--- Installing and configuring Xdebug ---"
sudo apt-get install -y php5-xdebug

xdebug.cli_color=1
xdebug.show_local_vars=1
EOF

echo "--- Enabling mod-rewrite ---"
sudo a2enmod rewrite

echo "--- Setting document root ---"
sudo rm -rf /var/www
sudo ln -fs /vagrant/public /var/www

echo "--- What developer codes without errors turned on? Not you, TeacherGraph ---"
sed -i "s/error_reporting = .*/error_reporting = E_ALL/" /etc/php5/apache2/php.ini
sed -i "s/display_errors = .*/display_errors = On/" /etc/php5/apache2/php.ini

sed -i 's/AllowOverride None/AllowOverride All/' /etc/apache2/apache2.conf

echo "--- How about adding teachergraph.dev:8080 for virtual host goodness? ---"
sudo a2enmod rewrite

curl https://gist.githubusercontent.com/KLVTZ/b4c8f24a19ea3e4b618f/raw/eef8506bfbbb316eda13625df141f1c70e83f0dc/vhost.sh > vhost
sudo chmod guo+x vhost
sudo mv vhost /usr/local/bin
sudo vhost -s teachergraph.dev -d /var/www/

echo "--- Restarting Apache ---"
sudo service apache2 restart


echo "--- Composer is the future. But you knew that, didn't you TeacherGraph? Nice job. ---"
curl -sS https://getcomposer.org/installer | php
sudo mv composer.phar /usr/local/bin/composer

# Laravel stuff here, if you want
echo "--- Jumpstart laravel 3 configuration ---"
sed -i "s/'password' => ''/'password' => 'root'/" /vagrant/application/config/local/database.php
echo "\n#ServerName\nServerName precise64



echo "--- Restarting Apache ---"
sudo service apache2 restart

echo "--- SEE YOU IN SPACE COWBOY... ---"
