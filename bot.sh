#!/usr/bin/env bash
set -euo pipefail

curl -fsSL https://download.docker.com/linux/debian/gpg \
 | gpg --dearmor -o /usr/share/keyrings/docker.gpg

echo \
"deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker.gpg] \
https://download.docker.com/linux/debian \
$(. /etc/os-release && echo "$VERSION_CODENAME") stable" \
> /etc/apt/sources.list.d/docker.list

sed -i '/^deb cdrom:/s/^/#/' /etc/apt/sources.list

apt-get clean && apt-get update && apt-get install -y \
sudo \
openssh-server \
firefox-esr \
docker-ce \
docker-ce-cli \
containerd.io \
docker-buildx-plugin \
docker-compose-plugin \
git \
make \
vim \
ca-certificates

sed -i '/^#X11UseLocalhost yes/s/^#//' /etc/ssh/sshd_config
systemctl restart ssh
sed -i "s/localhost/localhost ${USERNAME}.42.fr/" /etc/hosts
usermod -aG sudo,docker "${USERNAME}" && systemctl enable ssh docker
