#!/bin/bash


# Useful tools
yum install -y vim git

# Dependencies for PIL
yum install -y libjpeg-devel libtiff-devel zlib1g-devel libfreetype6-devel liblcms2-devel

# Redis
yum install -y redis-server

# PostgreSQL
yum install -y postgresql libpq-devel

# Java for Elasticsearch
yum install -y openjdk-7-jre-headless

# Dependencies for Python
yum install -y libssl-devel libncurses-devel liblzma-devel libgdbm-devel libsqlite3-devel libbz2-devel tk-devel libreadline6-dev


# Python 2.7
curl https://www.python.org/ftp/python/2.7.9/Python-2.7.9.tgz | tar xvz
cd Python-2.7.9
./configure
make
make install
cd ..
rm -rf Python-2.7.9

python2 -m ensurepip

pip2.7 install virtualenv
pip2.7 install psycopg2==2.6 libsass==0.6.2 Pillow==2.7.0


# Python 3.4
curl https://www.python.org/ftp/python/3.4.3/Python-3.4.3.tgz | tar xvz
cd Python-3.4.3
./configure
make
make install
cd ..
rm -rf Python-3.4.3

pip3.4 install psycopg2==2.6 libsass==0.6.2 Pillow==2.7.0


# Create vagrant pgsql superuser
su - postgres -c "createuser -s vagrant"


# Install Fabric and Sphinx
pip2.7 install Fabric==1.10.1 Sphinx==1.2.3


# Elasticsearch
echo "Downloading ElasticSearch..."
wget -q https://download.elasticsearch.org/elasticsearch/elasticsearch/elasticsearch-1.4.4.deb
dpkg -i elasticsearch-1.4.4.deb
update-rc.d elasticsearch defaults 95 10
service elasticsearch start
rm elasticsearch-1.4.4.deb


# Cleanup
yum clean

echo "Zeroing free space to improve compression..."
dd if=/dev/zero of=/EMPTY bs=1M
rm -f /EMPTY
