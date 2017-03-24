. $(dirname $0)/hosts-get.sh

echo 'Adding hostnames to /etc/hosts...'

hosts=$(getHosts)

for host in $hosts
do
	host=$(echo "$host"|tr -d '[:space:]')
	sudo -- sh -c -e "echo '192.34.0.03 $host # haroldangenent/box' >> /etc/hosts"
done

echo 'Finished adding hostnames to /etc/hosts.'
