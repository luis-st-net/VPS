#!/bin/bash
set -euo pipefail
{ for ip in $(curl -fsS https://www.cloudflare.com/ips-v4) $(curl -fsS https://www.cloudflare.com/ips-v6); do
    echo "set_real_ip_from $ip;"
  done
  echo "real_ip_header CF-Connecting-IP;"
} > /etc/nginx/cloudflare-realip.conf.tmp
mv /etc/nginx/cloudflare-realip.conf.tmp /etc/nginx/cloudflare-realip.conf
nginx -t && systemctl reload nginx

# echo '0 4 * * 0 root /etc/nginx/update-cf-realip.sh' > /etc/cron.d/update-cf-realip
# chmod 644 /etc/cron.d/update-cf-realip
# chown root:root /etc/nginx/update-cf-realip.sh
# chmod 700 /etc/nginx/update-cf-realip.sh

