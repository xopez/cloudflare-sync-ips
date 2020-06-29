# cloudflare-sync-ips
Sync Cloudflare IP's for nginx realip feature, apache2 and ufw firewall.
If you use cloudflare you only need to allow cloudflare in your firewall for security. Also, if you want to display the realip of the user and not of cloudflare, you have to set the real ip based on cloudflare ip's. Both processes get automated with it, so you don't need to lookup changes for yourself. Just run the script and thats it.

If you already include `/etc/nginx/conf.d` in your `nginx.conf` than thats it. Otherwise you have to include it manually

Also make a cronjob and be sure that ufw is enabled. Otherwise the config isn't held up2date and the firewall rules aren't included.
Don't forget to allow custom ports like ssh, ftp or whatever you need.

Outputs:
Nginx config:
```nginx
# Cloudflare
# Last Change: 28.06.2020 15:23:21

# - IPv4
set_real_ip_from 173.245.48.0/20;
set_real_ip_from 103.21.244.0/22;
set_real_ip_from 103.22.200.0/22;
set_real_ip_from 103.31.4.0/22;
set_real_ip_from 141.101.64.0/18;
set_real_ip_from 108.162.192.0/18;
set_real_ip_from 190.93.240.0/20;
set_real_ip_from 188.114.96.0/20;
set_real_ip_from 197.234.240.0/22;
set_real_ip_from 198.41.128.0/17;
set_real_ip_from 162.158.0.0/15;
set_real_ip_from 104.16.0.0/12;
set_real_ip_from 172.64.0.0/13;
set_real_ip_from 131.0.72.0/22;

# - IPv6
set_real_ip_from 2400:cb00::/32;
set_real_ip_from 2606:4700::/32;
set_real_ip_from 2803:f800::/32;
set_real_ip_from 2405:b500::/32;
set_real_ip_from 2405:8100::/32;
set_real_ip_from 2a06:98c0::/29;
set_real_ip_from 2c0f:f248::/32;

real_ip_header CF-Connecting-IP;

```

Apache2 config:
```apache
# Cloudflare
# Last Change: 28.06.2020 15:23:52

# - IPv4
RemoteIPTrustedProxy 173.245.48.0/20
RemoteIPTrustedProxy 103.21.244.0/22
RemoteIPTrustedProxy 103.22.200.0/22
RemoteIPTrustedProxy 103.31.4.0/22
RemoteIPTrustedProxy 141.101.64.0/18
RemoteIPTrustedProxy 108.162.192.0/18
RemoteIPTrustedProxy 190.93.240.0/20
RemoteIPTrustedProxy 188.114.96.0/20
RemoteIPTrustedProxy 197.234.240.0/22
RemoteIPTrustedProxy 198.41.128.0/17
RemoteIPTrustedProxy 162.158.0.0/15
RemoteIPTrustedProxy 104.16.0.0/12
RemoteIPTrustedProxy 172.64.0.0/13
RemoteIPTrustedProxy 131.0.72.0/22

# - IPv6
RemoteIPTrustedProxy 2400:cb00::/32
RemoteIPTrustedProxy 2606:4700::/32
RemoteIPTrustedProxy 2803:f800::/32
RemoteIPTrustedProxy 2405:b500::/32
RemoteIPTrustedProxy 2405:8100::/32
RemoteIPTrustedProxy 2a06:98c0::/29
RemoteIPTrustedProxy 2c0f:f248::/32

RemoteIPHeader CF-Connecting-IP
```

Ufw Outout on run:
```
Deleting:
 allow from 2c0f:f248::/32 to any port 80,443 proto tcp comment 'Cloudflare IP'
Proceed with operation (y|n)? Rule deleted (v6)
Deleting:
 allow from 2a06:98c0::/29 to any port 80,443 proto tcp comment 'Cloudflare IP'
Proceed with operation (y|n)? Rule deleted (v6)
Deleting:
 allow from 2405:8100::/32 to any port 80,443 proto tcp comment 'Cloudflare IP'
Proceed with operation (y|n)? Rule deleted (v6)
Deleting:
 allow from 2405:b500::/32 to any port 80,443 proto tcp comment 'Cloudflare IP'
Proceed with operation (y|n)? Rule deleted (v6)
Deleting:
 allow from 2803:f800::/32 to any port 80,443 proto tcp comment 'Cloudflare IP'
Proceed with operation (y|n)? Rule deleted (v6)
Deleting:
 allow from 2606:4700::/32 to any port 80,443 proto tcp comment 'Cloudflare IP'
Proceed with operation (y|n)? Rule deleted (v6)
Deleting:
 allow from 2400:cb00::/32 to any port 80,443 proto tcp comment 'Cloudflare IP'
Proceed with operation (y|n)? Rule deleted (v6)
Deleting:
 allow from 131.0.72.0/22 to any port 80,443 proto tcp comment 'Cloudflare IP'
Proceed with operation (y|n)? Rule deleted
Deleting:
 allow from 172.64.0.0/13 to any port 80,443 proto tcp comment 'Cloudflare IP'
Proceed with operation (y|n)? Rule deleted
Deleting:
 allow from 104.16.0.0/12 to any port 80,443 proto tcp comment 'Cloudflare IP'
Proceed with operation (y|n)? Rule deleted
Deleting:
 allow from 162.158.0.0/15 to any port 80,443 proto tcp comment 'Cloudflare IP'
Proceed with operation (y|n)? Rule deleted
Deleting:
 allow from 198.41.128.0/17 to any port 80,443 proto tcp comment 'Cloudflare IP'
Proceed with operation (y|n)? Rule deleted
Deleting:
 allow from 197.234.240.0/22 to any port 80,443 proto tcp comment 'Cloudflare IP'
Proceed with operation (y|n)? Rule deleted
Deleting:
 allow from 188.114.96.0/20 to any port 80,443 proto tcp comment 'Cloudflare IP'
Proceed with operation (y|n)? Rule deleted
Deleting:
 allow from 190.93.240.0/20 to any port 80,443 proto tcp comment 'Cloudflare IP'
Proceed with operation (y|n)? Rule deleted
Deleting:
 allow from 108.162.192.0/18 to any port 80,443 proto tcp comment 'Cloudflare IP'
Proceed with operation (y|n)? Rule deleted
Deleting:
 allow from 141.101.64.0/18 to any port 80,443 proto tcp comment 'Cloudflare IP'
Proceed with operation (y|n)? Rule deleted
Deleting:
 allow from 103.31.4.0/22 to any port 80,443 proto tcp comment 'Cloudflare IP'
Proceed with operation (y|n)? Rule deleted
Deleting:
 allow from 103.22.200.0/22 to any port 80,443 proto tcp comment 'Cloudflare IP'
Proceed with operation (y|n)? Rule deleted
Deleting:
 allow from 103.21.244.0/22 to any port 80,443 proto tcp comment 'Cloudflare IP'
Proceed with operation (y|n)? Rule deleted
Deleting:
 allow from 173.245.48.0/20 to any port 80,443 proto tcp comment 'Cloudflare IP'
Proceed with operation (y|n)? Rule deleted
Rule added
Rule added
Rule added
Rule added
Rule added
Rule added
Rule added
Rule added
Rule added
Rule added
Rule added
Rule added
Rule added
Rule added
Rule added (v6)
Rule added (v6)
Rule added (v6)
Rule added (v6)
Rule added (v6)
Rule added (v6)
Rule added (v6)
Firewall reloaded
```

Ufw Output with `ufw status verbose`:
```
Status: active
[...]
To                         Action      From
--                         ------      ----
80,443/tcp                 ALLOW IN    173.245.48.0/20            # Cloudflare IP | Last Change: 29.06.2020 04:45:48
80,443/tcp                 ALLOW IN    103.21.244.0/22            # Cloudflare IP | Last Change: 29.06.2020 04:45:48
80,443/tcp                 ALLOW IN    103.22.200.0/22            # Cloudflare IP | Last Change: 29.06.2020 04:45:48
80,443/tcp                 ALLOW IN    103.31.4.0/22              # Cloudflare IP | Last Change: 29.06.2020 04:45:48
80,443/tcp                 ALLOW IN    141.101.64.0/18            # Cloudflare IP | Last Change: 29.06.2020 04:45:48
80,443/tcp                 ALLOW IN    108.162.192.0/18           # Cloudflare IP | Last Change: 29.06.2020 04:45:48
80,443/tcp                 ALLOW IN    190.93.240.0/20            # Cloudflare IP | Last Change: 29.06.2020 04:45:48
80,443/tcp                 ALLOW IN    188.114.96.0/20            # Cloudflare IP | Last Change: 29.06.2020 04:45:48
80,443/tcp                 ALLOW IN    197.234.240.0/22           # Cloudflare IP | Last Change: 29.06.2020 04:45:48
80,443/tcp                 ALLOW IN    198.41.128.0/17            # Cloudflare IP | Last Change: 29.06.2020 04:45:48
80,443/tcp                 ALLOW IN    162.158.0.0/15             # Cloudflare IP | Last Change: 29.06.2020 04:45:48
80,443/tcp                 ALLOW IN    104.16.0.0/12              # Cloudflare IP | Last Change: 29.06.2020 04:45:48
80,443/tcp                 ALLOW IN    172.64.0.0/13              # Cloudflare IP | Last Change: 29.06.2020 04:45:48
80,443/tcp                 ALLOW IN    131.0.72.0/22              # Cloudflare IP | Last Change: 29.06.2020 04:45:48
80,443/tcp                 ALLOW IN    2400:cb00::/32             # Cloudflare IP | Last Change: 29.06.2020 04:45:48
80,443/tcp                 ALLOW IN    2606:4700::/32             # Cloudflare IP | Last Change: 29.06.2020 04:45:48
80,443/tcp                 ALLOW IN    2803:f800::/32             # Cloudflare IP | Last Change: 29.06.2020 04:45:48
80,443/tcp                 ALLOW IN    2405:b500::/32             # Cloudflare IP | Last Change: 29.06.2020 04:45:48
80,443/tcp                 ALLOW IN    2405:8100::/32             # Cloudflare IP | Last Change: 29.06.2020 04:45:48
80,443/tcp                 ALLOW IN    2a06:98c0::/29             # Cloudflare IP | Last Change: 29.06.2020 04:45:48
80,443/tcp                 ALLOW IN    2c0f:f248::/32             # Cloudflare IP | Last Change: 29.06.2020 04:45:48
```
