#!/bin/bash

# Array of applications to be installed
apps=(

vim
git
pv
tree
curl
php5
apache2
libapache2-mod-php5
php-pear

)

# Loop over apps and install each one with default 'yes' flag
for app in "${apps[@]}"
do
	apt-get install $app -y
done

# Enable apache rewrite module
a2enmod rewrite

# Set git credentials
git config --global user.name "YOUR NAME"
git config --global user.email YOU@YOUREMAIL.com

# MySQL
apt-get install mysql-server php5-mysql -y

service apache2 restart
