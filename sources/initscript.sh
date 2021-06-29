#!/bin/bash

set -eu

# Create user kaas with ssh
useradd -m -p `openssl passwd -1 WelkomStudent!` -s /bin/bash kaas
mkdir /home/kaas/.ssh
ssh-keygen -b 2048 -t rsa -f /home/kaas/.ssh/id_rsa
chown kaas:kaas -R /home/kaas/.ssh



## create root ssh authorized keys for flag
mkdir /root/.ssh
chmod 600 /root/.ssh -R
cat /home/kaas/.ssh/id_rsa.pub >> /root/.ssh/authorized_keys