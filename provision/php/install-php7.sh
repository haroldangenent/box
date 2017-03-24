echo 'Installing php7.1...'
echo 'Updating apt-get repositories...'
sudo apt-get update &> /dev/null
echo 'Adding php7.1...'
sudo add-apt-repository ppa:ondrej/php -y &> /dev/null
echo 'Installing php7.1...'
sudo apt-get install php7.1 -y &> /dev/null
echo 'Updating apt-get repositories...'
sudo apt-get update &> /dev/null
echo 'Installing php7.1 modules...'
sudo apt-get install php7.1-mysql libapache2-mod-php7.1 php7.1-xml php7.1-mbstring php7.1-curl php7.1-xdebug php7.1-gd php7.1-soap -y &> /dev/null
echo 'Disabling php5...'
sudo a2dismod php5 &> /dev/null
echo 'Enabling php7.1...'
sudo a2enmod php7.1 &> /dev/null
echo 'Copying config preferences...'
cp /vagrant/config/php.ini /etc/php/7.1/apache2/conf.d/php.ini
echo 'Restarting webserver...'
sudo service apache2 restart &> /dev/null
echo 'Finished installing php7.1.'
