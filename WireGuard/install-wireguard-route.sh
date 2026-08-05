cat > /etc/netplan/99-vpn-route.yaml <<'EOF'
network:
  version: 2
  ethernets:
    enp7s0:
      routes:
        - to: 10.2.0.0/24
          via: 10.0.0.1
EOF
chmod 600 /etc/netplan/99-vpn-route.yaml
netplan generate
netplan apply
