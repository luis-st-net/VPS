sudo fallocate -l <size_in_gb>G /swap
sudo chmod 600 /swap
sudo mkswap /swap
sudo swapon /swap
# Make permanent by adding to /etc/fstab
/swap none swap sw 0 0