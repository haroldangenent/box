. $(dirname $0)/hosts-get.sh

echo 'Cleaning up hostnames from /etc/hosts...'

hosts=$(getHosts)
ip=$(getIp)

for host in $hosts
do
	host=$(echo "$host"|tr -d '[:space:]')
	sudo sed -i '' "/$ip $host \# haroldangenent\/box/d" /etc/hosts
done

echo 'Finished cleaning /etc/hosts.'
