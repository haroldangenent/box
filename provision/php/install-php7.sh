echo 'Installing php7.2...'
echo 'Updating apt-get repositories...'
sudo apt-get update &> /dev/null
echo 'Adding php7.2...'
sudo add-apt-repository ppa:ondrej/php -y &> /dev/null
echo 'Installing php7.2...'
sudo apt-get install php7.2 -y &> /dev/null
echo 'Updating apt-get repositories...'
sudo apt-get update &> /dev/null
echo 'Installing php7.2 modules...'
sudo apt-get install php7.2-mysql libapache2-mod-php7.2 php7.2-xml php7.2-mbstring php7.2-curl php7.2-xdebug php7.2-gd php7.2-soap -y &> /dev/null
echo 'Disabling php5...'
sudo a2dismod php5 &> /dev/null
echo 'Enabling php7.2...'
sudo a2enmod php7.2 &> /dev/null
echo 'Copying config preferences...'
cp /vagrant/config/php.ini /etc/php/7.2/apache2/conf.d/php.ini
echo 'Restarting webserver...'
sudo service apache2 restart &> /dev/null
echo 'Finished installing php7.2.'
