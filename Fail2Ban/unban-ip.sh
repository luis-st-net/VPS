# Start interactive mode
fail2ban-client -i
# List banned ips of sshd table
status sshd
# Unban the specified ip
set sshd unbanip <ip>