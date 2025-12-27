sudo apt update
sudo apt upgrade
sudo apt install ca-certificates
sudo apt install curl
sudo apt install gnupg
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt update
sudo apt upgrade

sudo apt install docker-ce 
sudo apt install docker-ce-cli 
sudo apt install containerd.io 
sudo apt install docker-buildx-plugin 
sudo apt install docker-compose-plugin
sudo docker run hello-world
