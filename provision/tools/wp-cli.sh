echo 'Updating wp-cli...'
sudo curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar &> /dev/null
sudo chmod +x wp-cli.phar &> /dev/null
sudo mv wp-cli.phar /usr/local/bin/wp &> /dev/null
echo 'Finished updating wp-cli.'
