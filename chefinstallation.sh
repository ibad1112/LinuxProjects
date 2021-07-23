#!/bin/bash

echo "This file installs the chef workstation"
echo "Do you want to proceed"
read permission

if [[ $permission == "y" ]]; then
	mkdir -pv ./chefworkstation/installation/
	cd ./chefworkstation/installation/
	wget https://packages.chef.io/files/stable/chef-workstation/21.6.467/amazon/2/chef-workstation-21.6.467-1.el7.x86_64.rpm 
	yum update -y
	yum install chef-workstation-21.6.467-1.el7.x86_64.rpm
	chef --version
	which chef
else
	echo "oops be careful when trying to run unknown scripts"
fi


