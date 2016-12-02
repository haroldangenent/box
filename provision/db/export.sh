echo 'Exporting all databases...';
sudo mysqldump --add-drop-database --all-databases --events -uroot > /vagrant/db/db.sql
echo 'Finished database export.'
