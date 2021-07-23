This project aim is to develop and deploy an e-commerce application. 

It consists of two parts 
1. Setting up the Environment.
2. Deploying the application.

The e-commerce application is a fictional online store that sells electronic device. It is a LAMP stack application, however instead of MYSQL, MariaDB is used which is a community fork of MYSQL and is pretty much similar. If required one can replace MariaDB with MYSQL as well.

## Setting up the Environment

Setting up the environment can be broken down into five parts

1. Selecting a system on which the application is to be deployed and install firewall in it. In our case it will be deployed on a CentOS machine.
2. Install and configure apache httpd server. Enable and start the service.
3. Install and configure MariaDB database. Enable and start the database services.
4. Install and configure Php on the server. Configure the source code to work with apache and Php.
5. Creating the necessary role to communicate between these services.

### Installing Firewall

Firewall is installed and enabled with the following commands

sudo yum install firewalld
sudo service firewalld start
sudo systemctl enable firewalld

