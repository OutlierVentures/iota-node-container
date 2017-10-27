#!/bin/sh

# Install the build dependencies to build the wallet software. Run these within the app container.

apt-get install icnsutils build-essential
apt install libc6-dev-i386
# not sure if this one is necessary
apt install libssl-dev libbz2-dev liblzo2-dev

# Should check which version is required
apt install libstdc++6-4.7-dev
apt install libstdc++5
# This fixed the bits/c++config... error
sudo apt-get install gcc-multilib g++-multilib


