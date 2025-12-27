sudo nano /etc/ssh/sshd_config
# Change line
PermitRootLogin without-password
# Add this at the end of the file to allow login from all other servers via password
Match Address 10.0.0.0/16
    PermitRootLogin yes
sudo systemctl restart ssh.service
sudo systemctl restart sshd.service