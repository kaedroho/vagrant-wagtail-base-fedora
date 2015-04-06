Wagtail base Vagrant box (Fedora version)
=========================================

A Vagrant box based on Fedora 21, with some extra software preinstalled to make developing projects with Wagtail easier and faster.


Contents
--------

This image is based on [chef/fedora-21](https://atlas.hashicorp.com/chef/boxes/fedora-21). It has the following extras installed:

 - Python 2.7.8 with virtualenv and pip
 - Python 3.4.1 with pip (use bundled pyvenv for virtual environments)
 - PostgreSQL 9.3.6
 - Redis 2.8.19
 - Elasticsearch 1.5.0
 - Vim, Git, GCC (with C++ support)
 - Development headers for Python (2 and 3), PostgreSQL and some image libraries (libjpeg, zlib, etc)
 - Prebuilt wheels for Pillow 2.8.1, psycopg2 2.6 and libsass 0.7.0 for both python versions (and pip configured to use them)

Build instructions
------------------
To generate the .box file:

    ./build.sh

To install locally:

    vagrant box add wagtail-base-fedora wagtail-base-fedora-v1.0.0.box
