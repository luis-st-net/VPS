# Remote
sudo docker load -i .\<name>-<version>.tar
sudo docker tag <image> <name>:<version>
sudo docker stop <container> # Only on update
sudo docker rm <container> # Only on update
sudo docker run -d -p 3000:3000 --name <name> <name>:<version>
