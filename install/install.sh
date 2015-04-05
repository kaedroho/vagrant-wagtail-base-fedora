#!/bin/bash


# Useful tools
yum install -y vim git

# Dependencies for PIL
yum install -y libjpeg-devel libtiff-devel zlib1g-devel libfreetype6-devel liblcms2-devel

# Redis
yum install -y redis

# PostgreSQL
yum install -y postgresql postgresql-server libpq-devel
postgresql-setup initdb

# Java for Elasticsearch
yum install -y openjdk-7-jre-headless

# Python
yum install -y python python-devel python-pip
yum install -y python3 python3-devel python3-pip


pip2.7 install virtualenv
pip2.7 install psycopg2==2.6 libsass==0.6.2 Pillow==2.7.0

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
