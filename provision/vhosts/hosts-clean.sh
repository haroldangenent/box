echo 'Cleaning up hostnames from /etc/hosts...'

hostnames=$(vagrant ssh -c "/usr/sbin/apache2ctl -S 2>&1 | awk '/namevhost/' | awk '{print \$4;}'")
aliases=$(vagrant ssh -c "/usr/sbin/apache2ctl -S 2>&1 | awk '/alias/' | awk '{print \$2;}'")
hosts="$hostnames$aliases"

for host in $hosts
do
	host=$(echo "$host"|tr -d '[:space:]')
	sudo sed -i '' "/192.34.0.03 $host \# haroldangenent\/box/d" /etc/hosts
done

echo 'Finished cleaning /etc/hosts.'
