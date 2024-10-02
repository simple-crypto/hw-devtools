#! /bin/bash

VERILATOR_VERSION=5.024

sudo apt install git-buildpackage equivs

git clone https://salsa.debian.org/electronics-team/verilator
cd verilator
git checkout debian/${VERILATOR_VERSION}-1
sudo mk-build-deps -i debian/control
git reset --hard
git clean -f -d
gbp buildpackage --git-ignore-branch --no-sign
