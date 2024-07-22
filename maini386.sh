#! /bin/bash

export DEBIAN_FRONTEND="noninteractive"
export DEB_BUILD_OPTIONS="nocheck notest terse"
export DPKG_GENSYMBOLS_CHECK_LEVEL=0

# Clone Upstream
mkdir -p ./src-pkg-name
cp -rvf ./debian ./src-pkg-name/
cd ./src-pkg-name/

# Get build deps
apt-get build-dep ./ -y

# Build package
dpkg-buildpackage --no-sign

# Move the debs to output
cd ../
mkdir -p ./output
mv ./*.deb ./output/
