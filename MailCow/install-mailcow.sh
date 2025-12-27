cd /opt
git clone https://github.com/mailcow/mailcow-dockerized
cd mailcow-dockerized
sudo ./generate_config.sh
# Enter mail.home-system.net for the domain
# Enter Europe/Berlin for the time zone
# Enter 1 for stable branch