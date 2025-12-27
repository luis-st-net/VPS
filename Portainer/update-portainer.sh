docker pull portainer/portainer-ce:<version_in_ui>-linux-arm
docker stop portainer
docker rm portainer
sudo docker run -d -p 3002:9443 --name portainer --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer-ce:<version_in_ui>-linux-arm
