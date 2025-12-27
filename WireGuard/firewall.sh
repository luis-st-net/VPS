sudo ufw allow 51820/udp
sudo ufw route allow in on wg0 out on eth0
sudo ufw route allow in on eth0 out on wg0
sudo ufw route allow in on wg0
sudo ufw route allow out on wg0


net/ipv4/ip_forward=0 > net/ipv4/ip_forward=1

# Add at the top if missing or insert just the rule
*nat
:POSTROUTING ACCEPT [0:0]

-A POSTROUTING -s 10.2.0.0/24 -o eth0 -j MASQUERADE

COMMIT

