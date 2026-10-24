sudo apt install unattended-upgrades
sudo dpkg-reconfigure -plow unattended-upgrade

cat <<'EOF' | sudo tee /etc/apt/apt.conf.d/52unattended-upgrades-local > /dev/null
// Remove packages that are no longer needed
Unattended-Upgrade::Remove-Unused-Kernel-Packages "true";
Unattended-Upgrade::Remove-Unused-Dependencies "true";

// Kernel/libc updates need a reboot to actually take effect
Unattended-Upgrade::Automatic-Reboot "true";
Unattended-Upgrade::Automatic-Reboot-WithUsers "true";
Unattended-Upgrade::Automatic-Reboot-Time "04:00";   // mail server: e.g. "04:30"

// Never touch Docker automatically
Unattended-Upgrade::Package-Blacklist {
    "docker-ce";
    "docker-ce-cli";
    "containerd.io";
    "docker-buildx-plugin";
    "docker-compose-plugin";
};
EOF

sudo unattended-upgrade --dry-run --debug
