#!/bin/bash

# to build wagtail-base-v1.0.0.box:
vagrant destroy
vagrant up
vagrant halt
rm -f wagtail-base-v1.0.0.box
vagrant package --output wagtail-base-fedora-v1.0.0.box

# to install locally:
# vagrant box add wagtail-base-fedora-v1.0.0 wagtail-base-fedora-v1.0.0.box
