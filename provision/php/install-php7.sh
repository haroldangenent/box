echo 'Installing PHP 7.0...'
echo 'Updating apt-get repositories...'
sudo apt-get update &> /dev/null
echo 'Added php7.0...'
sudo add-apt-repository ppa:ondrej/php -y &> /dev/null
echo 'Installing php7.0...'
sudo apt-get install php7.0 -y &> /dev/null
echo 'Updating apt-get repositories...'
sudo apt-get update &> /dev/null
echo 'Installing php7.0 modules...'
sudo apt-get install php7.0-mysql libapache2-mod-php7.0 -y &> /dev/null
echo 'Disabling php5...'
sudo a2dismod php5 &> /dev/null
echo 'Enabling php7.0...'
sudo a2enmod php7.0 &> /dev/null
echo 'Restarting webserver...'
sudo service apache2 restart &> /dev/null
echo 'Finished installing PHP 7.0.'
