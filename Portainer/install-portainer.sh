sudo docker volume create portainer_data
sudo docker pull portainer/portainer-ce:latest
sudo docker run -d -p 3002:9443 --name portainer --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer-ce:<version>-linux-arm
