. $(dirname $0)/hosts-get.sh

echo 'Adding hostnames to /etc/hosts...'

hosts=$(getHosts)
ip=$(getIp)

for host in $hosts
do
	host=$(echo "$host"|tr -d '[:space:]')
	sudo -- sh -c -e "echo '$ip $host # haroldangenent/box' >> /etc/hosts"
done

echo 'Finished adding hostnames to /etc/hosts.'
