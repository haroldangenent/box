. $(dirname $0)/hosts-get.sh

echo 'Cleaning up hostnames from /etc/hosts...'

hosts=$(getHosts)

for host in $hosts
do
	host=$(echo "$host"|tr -d '[:space:]')
	sudo sed -i '' "/192.34.0.03 $host \# haroldangenent\/box/d" /etc/hosts
done

echo 'Finished cleaning /etc/hosts.'
