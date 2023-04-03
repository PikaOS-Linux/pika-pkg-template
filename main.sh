#! /bin/bash

DEBIAN_FRONTEND=noninteractive

# Add dependent repositories
wget -q -O - url-of-pika-sources.deb | sudo apt install -
# Clone Upstream
mkdir -p ./debian ./src-pkg-name

# Get build deps
ln -fs /usr/share/zoneinfo/America/New_York /etc/localtime
DEBIAN_FRONTEND=noninteractive apt-get install -y tzdata
apt-get build-dep ./ -y

# Build package
dpkg-buildpackage --no-sign

# Move the debs to output
cd ../
mkdir -p ./output
mv ./*.deb ./output/
