mkdir -p ~/.ssh
sudo chmod 700 ~/.ssh
echo "<key>" >> ~/.ssh/authorized_keys
sudo chmod 600 ~/.ssh/authorized_keys
sudo systemctl restart ssh.service
sudo systemctl restart sshd.service
