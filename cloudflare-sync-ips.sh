#!/bin/bash

responseipv4=$(curl --head --write-out %{http_code} --silent --output /dev/null https://www.cloudflare.com/ips-v4)
responseipv6=$(curl --head --write-out %{http_code} --silent --output /dev/null https://www.cloudflare.com/ips-v6)

if [ "$responseipv4" == "200" ] && [ "$responseipv6" == "200" ]; then
	CLOUDFLARE_FILE_PATH=/etc/nginx/cloudflare_realip.conf
	curl https://www.cloudflare.com/ips-v4 -o /tmp/cf_ipv4
	curl https://www.cloudflare.com/ips-v6 -o /tmp/cf_ipv6
	cat /tmp/cf_ipv4 /tmp/cf_ipv6 > /tmp/cf_ips

	echo "# Cloudflare" > $CLOUDFLARE_FILE_PATH;
	echo "" >> $CLOUDFLARE_FILE_PATH;

	echo "# - IPv4" >> $CLOUDFLARE_FILE_PATH;
	for i in `cat /tmp/cf_ipv4`; do
		echo "set_real_ip_from $i;" >> $CLOUDFLARE_FILE_PATH;
	done

	echo "" >> $CLOUDFLARE_FILE_PATH;
	echo "# - IPv6" >> $CLOUDFLARE_FILE_PATH;
	for i in `cat /tmp/cf_ipv6`; do
		echo "set_real_ip_from $i;" >> $CLOUDFLARE_FILE_PATH;
	done

	#test configuration and reload nginx
	nginx -t && systemctl reload nginx

	#ufw part
	for NUM in $(ufw status numbered | grep 'Cloudflare IP' | awk -F"[][]" '{print $2}' | tr --delete [:blank:] | sort -rn); do
		yes | ufw delete $NUM;
	done

	for cfip in `cat /tmp/cf_ips`; do
		ufw allow proto tcp from $cfip to any port 80,443 comment 'Cloudflare IP';
	done
fi
