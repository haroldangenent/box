echo 'Enabling SSL module...'
sudo a2enmod ssl &> /dev/null
echo 'Restarting webserver...'
sudo service apache2 restart &> /dev/null
echo 'SSL module enabled.'
