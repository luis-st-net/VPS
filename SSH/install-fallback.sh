sudo tee /etc/ssh/sshd_fallback.conf >/dev/null <<'EOF'
Port 9999
ListenAddress 0.0.0.0
PidFile /run/sshd-fallback.pid

HostKey /etc/ssh/ssh_host_ed25519_key

AllowUsers root
PermitRootLogin prohibit-password
PubkeyAuthentication yes
AuthorizedKeysFile .ssh/authorized_keys
PasswordAuthentication no
KbdInteractiveAuthentication no
PermitEmptyPasswords no
UsePAM yes

LoginGraceTime 20
MaxAuthTries 3
MaxSessions 4
MaxStartups 3:50:10
ClientAliveInterval 60
ClientAliveCountMax 3

X11Forwarding no
AllowAgentForwarding no
AllowTcpForwarding yes
PermitTunnel no

LogLevel VERBOSE
SyslogFacility AUTH
Subsystem sftp internal-sftp
EOF
sudo sshd -t -f /etc/ssh/sshd_fallback.conf && echo OK

sudo tee /etc/systemd/system/sshd-fallback.service >/dev/null <<'EOF'
[Unit]
Description=Fallback OpenSSH server (port 9999)
After=network.target auditd.service

[Service]
Type=notify
ExecStartPre=/usr/bin/mkdir -p -m 0755 /run/sshd
ExecStartPre=/usr/sbin/sshd -t -f /etc/ssh/sshd_fallback.conf
ExecStart=/usr/sbin/sshd -D -f /etc/ssh/sshd_fallback.conf
ExecReload=/usr/sbin/sshd -t -f /etc/ssh/sshd_fallback.conf
ExecReload=/bin/kill -HUP $MAINPID
KillMode=process
Restart=on-failure
RestartSec=5

[Install]
WantedBy=multi-user.target
EOF

sudo systemctl daemon-reload
sudo systemctl enable --now sshd-fallback
