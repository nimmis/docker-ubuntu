#!/bin/bash

# fix docker issue #1024
dpkg-divert --local --rename --add /sbin/initctl
ln -sf /bin/true /sbin/initctl

# https://bugs.launchpad.net/launchpad/+bug/974584
dpkg-divert --local --rename --add /usr/bin/ischroot
ln -sf /bin/true /usr/bin/ischroot

# enable multiverse repository
sed -i 's/^#\s*\(deb.*multiverse\)$/\1/g' /etc/apt/sources.list
apt-get update

# install add-apt-repository command for adding repos.
apt-get install -y --no-install-recommends software-properties-common

# set US locale
apt-get install -y --no-install-recommends language-pack-en
locale-gen en_US

# install some often used commands
apt-get install -y --no-install-recommends wget curl zip unzip patch less git vim nano psmisc

# installing syslog-ng, with workaround https://bugs.launchpad.net/ubuntu/+source/syslog-ng/+bug/1242173
apt-get install -y --no-install-recommends syslog-ng syslog-ng-core
# can't access /proc/kmsg. https://groups.google.com/forum/#!topic/docker-user/446yoB0Vx6w
sed -i -E 's/^(\s*)system\(\);/\1unix-stream("\/dev\/log");/' /etc/syslog-ng/syslog-ng.conf

# prepare for using supervisor
apt-get install -y --no-install-recommends supervisor

# setup cron and logrotate
apt-get install -y --no-install-recommends cron logrotate

# do a update on all installed packages
apt-get -y --no-install-recommends dist-upgrade

# clean up after
apt-get clean all

