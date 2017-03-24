getHosts() {
	hostnames=$(vagrant ssh -c "/usr/sbin/apache2ctl -S 2>&1 | awk '/namevhost/' | awk '{print \$4;}'")
	aliases=$(vagrant ssh -c "/usr/sbin/apache2ctl -S 2>&1 | awk '/alias/' | awk '{print \$2;}'")
	echo "$hostnames$aliases"
}

getIp() {
	ip=$(vagrant ssh -c "/sbin/ifconfig eth1 | grep 'inet addr:' | cut -d: -f2 | awk '{ print \$1}'")
	echo "$ip"|tr -d '[:space:]'
}
