#!/bin/bash

# Array of applications to be installed
apps=(

gconf-editor
apache2
php5
libapache2-mod-php5
php-pear
screen
vim
vim-gnome
emacs
nano
java-jre
perl
git
subversion
pv
meld
netbeans
tree
mysql-workbench
idle
pidgin
curl

)

# Loop over apps and install each one with default 'yes' flag
for app in "${apps[@]}"
do
	apt-get install $app -y
done

# Pear (PHPUnit and Xdebug)
pear channel-discover pear.symfony-project.com
pear channel-discover pear.phpunit.de
pear install --alldeps phpunit/PHPUnit

pear channel-discover pecl.php.net
pear install pecl/xdebug

# Set git credentials
git config --global user.name "YOUR NAME"
git config --global user.email "YOU@YOUREMAIL.com"

# MySQL
apt-get install mysql-server php5-mysql  -y
/etc/init.d/apache2 restart

# Dropbox
wget -O - "http://www.dropbox.com/download?plat=lnx.x86_64" | tar xzf - # remove _64 for x86 platforms
~/.dropbox-dist/dropboxd

# Ruby (RVM)
curl -L https://get.rvm.io | bash -s stable --ruby
source /home/{YOUR_USERNAME}/.rvm/scripts/rvm
