#!/usr/bin/env bash
set -euo pipefail

sed -i '/^deb cdrom:/s/^/#/' /etc/apt/sources.list
apt-get update && apt-get install -y sudo openssh-server xfce4 lightdm firefox-esr docker docker-compose git make ca-certificates && usermod -aG sudo,docker $USERNAME && systemctl enable ssh docker lightdm
