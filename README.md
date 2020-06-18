# cloudflare-sync-ips
Sync Cloudflare IP's for nginx realip feature and ufw firewall.
If you use cloudflare you only need to allow cloudflare in your firewall for security. Also, if you want to display the realip of the user and not of cloudflare, you have to set the real ip based on cloudflare ip's. Both processes get automated with it, so you don't need to lookup changes for yourself. Just run the script and thats it.

You also need to include this in your `nginx.conf`:
```nginx
# Cloudflare
include /etc/nginx/cloudflare_realip.conf;
real_ip_header CF-Connecting-IP;
```

Also make a cronjob and be sure that ufw is enabled. Don't forget to allow custom ports like ssh, ftp or whatever you need.
