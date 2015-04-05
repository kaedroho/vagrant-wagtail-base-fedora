#!/bin/bash


# Useful tools
yum install -y vim git gcc gcc-c++

# Dependencies for PIL
yum install -y libjpeg-devel libtiff-devel zlib1g-devel libfreetype6-devel liblcms2-devel

# Redis
yum install -y redis
systemctl enable redis

# PostgreSQL
yum install -y postgresql postgresql-server postgresql-devel
postgresql-setup initdb
systemctl enable postgresql

# Java for Elasticsearch
yum install -y java-1.8.0-openjdk-headless

# Python
yum install -y python python-devel python-pip
yum install -y python3 python3-devel python3-pip

pip2.7 install virtualenv wheel
pip3.4 install wheel

su - vagrant -c "pip2.7 wheel psycopg2==2.6 libsass==0.7.0 Pillow==2.8.1"
su - vagrant -c "pip3.4 wheel psycopg2==2.6 libsass==0.7.0 Pillow==2.8.1"


# Create vagrant pgsql superuser
su - postgres -c "createuser -s vagrant"


# Install Fabric and Sphinx
pip2.7 install Fabric==1.10.1 Sphinx==1.2.3


# Elasticsearch
echo "Downloading Elasticsearch..."
wget -q https://download.elasticsearch.org/elasticsearch/elasticsearch/elasticsearch-1.5.0.noarch.rpm
yum install -y elasticsearch-1.5.0.noarch.rpm
rm elasticsearch-1.5.0.noarch.rpm
systemctl enable elasticsearch


# Cleanup
yum clean

echo "Zeroing free space to improve compression..."
dd if=/dev/zero of=/EMPTY bs=1M
rm -f /EMPTY
