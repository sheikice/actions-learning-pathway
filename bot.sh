#!/usr/bin/env bash
set -euo pipefail

apt update && apt install -y sudo openssh-server xfce4 lightdm firefox-esr docker.io docker-compose-plugin git make ca-certificates && usermod -aG sudo,docker $USERNAME && systemctl enable ssh docker lightdm
