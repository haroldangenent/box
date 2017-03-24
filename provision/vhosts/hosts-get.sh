getHosts() {
	hostnames=$(vagrant ssh -c "/usr/sbin/apache2ctl -S 2>&1 | awk '/namevhost/' | awk '{print \$4;}'")
	aliases=$(vagrant ssh -c "/usr/sbin/apache2ctl -S 2>&1 | awk '/alias/' | awk '{print \$2;}'")
	echo "$hostnames$aliases"
}
