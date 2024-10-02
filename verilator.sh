#! /bin/bash

set -e

VERILATOR_VERSION=5.006

sudo apt-get -y install git-buildpackage equivs

git clone https://salsa.debian.org/electronics-team/verilator
cd verilator
git checkout debian/${VERILATOR_VERSION}-2
git checkout -b simple-dev
git config user.name CI
git config user.email ci@local
#git revert --no-edit cd7e5355a0e14953961a16a97cd8541f08acf370
sudo mk-build-deps -i debian/control
git reset --hard
git clean -f -d
gbp buildpackage --git-ignore-branch --no-sign
