# Cloudflare token
#   Zone permissions:
#     Zone → DNS → Edit 
#     Zone → Zone → Read

curl https://get.acme.sh | sh -s [email protected]
export CF_Token="your_token_here"
~/.acme.sh/acme.sh --set-default-ca --server letsencrypt
~/.acme.sh/acme.sh --issue --dns dns_cf -d <domain> -d '*.<domain>'

~/.acme.sh/acme.sh --install-cert -d <domain> -d '*.<domain>' \
  --key-file       /etc/nginx/ssl/<domain>.key \
  --fullchain-file /etc/nginx/ssl/<domain>.cer \
  --reloadcmd      "systemctl reload nginx"
nginx -t && systemctl reload nginx
