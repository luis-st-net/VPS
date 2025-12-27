sudo ufw route allow in on tun0 out on enp7s0
sudo ufw route allow in on enp7s0 out on tun0

net/ipv4/ip_forward=0 > net/ipv4/ip_forward=1
net/ipv6/conf/default/forwarding=0 > net/ipv6/conf/default/forwarding=1
net/ipv6/conf/all/forwarding=0 >net/ipv6/conf/all/forwarding=1