echo 'Installing php7.3...'
echo 'Updating apt-get repositories...'
sudo apt-get update &> /dev/null
echo 'Adding php7.3...'
sudo add-apt-repository ppa:ondrej/php -y &> /dev/null
echo 'Installing php7.3...'
sudo apt-get install php7.3 -y &> /dev/null
echo 'Updating apt-get repositories...'
sudo apt-get update &> /dev/null
echo 'Installing php7.3 modules...'
sudo apt-get install php7.3-mysql libapache2-mod-php7.3 php7.3-xml php7.3-mbstring php7.3-curl php7.3-xdebug php7.3-gd php7.3-soap -y &> /dev/null
echo 'Disabling php5...'
sudo a2dismod php5 &> /dev/null
echo 'Enabling php7.3...'
sudo a2enmod php7.3 &> /dev/null
echo 'Copying config preferences...'
cp /vagrant/config/php.ini /etc/php/7.3/apache2/conf.d/php.ini
echo 'Restarting webserver...'
sudo service apache2 restart &> /dev/null
echo 'Finished installing php7.3.'
