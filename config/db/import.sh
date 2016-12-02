if [ -e /vagrant/db/db.sql ]
  then
  	echo 'Importing databases...'
    sudo mysql -p'root' < /vagrant/db/db.sql
    echo 'Finished database import.'
fi
