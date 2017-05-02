echo 'Installing webgrind...'
echo 'Cloning repository...'
git clone https://github.com/jokkedk/webgrind.git /var/www/webgrind &> /dev/null
echo 'Installing graphviz...'
sudo apt-get install graphviz -y &> /dev/null
echo 'Finished installing webgrind.'
