# Localy
docker buildx build --load --platform linux/arm64 -t main-web:latest .
docker save -o D:\Programmieren\Docker\Images\main-web-<version>.tar <image>
# Move to remote