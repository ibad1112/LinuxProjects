This project aim is to develop and deploy an e-commerce application. The e-commerce application is a fictional online store that sells electronic device. It is a LAMP stack application, however instead of MYSQL, MariaDB is used which is a community fork of MYSQL and is pretty much similar. If required one can replace MariaDB with MYSQL as well. Here is how to deploy it in CentOS system

### Installing Firewall

```
sudo yum install firewalld
sudo service firewalld start
sudo systemctl enable firewalld
```

To confirm that the firewall is running use the command
```
sudo service firewalld status
```
and confirm that firewalld service is active.

### Installing MariaDB

```
sudo yum install mariadb-server
vi /etc/my.cnf  # Configure the file with right port. It is the MySQL configuration file. We use MySQL client to connect to the MariaDB database
sudo service mariadb start
sudo systemctl enable mariadb
```
again to check whether the service is active and running
```
sudo service mariadb status
```

### Configuring Firewall

```
sudo firewall-cmd --permanent --zone=public --add-port=3306/tcp                 # Adding required firewall rules to enable access to SQL Database
sudo firewall-cmd --reload                                                      # Reload the firewall to make sure the changes take place
```
Check whether the new rule is in place or not
```
sudo firewall-cmd --list-all
```
This will show the 3306 in the port tab, indicating that the new rule is in place

### Downloading Supporting Code

```
sudo yum install -y git
git clone https://github.com/ibad1112/LinuxProjects.git /var/www/html/
sudo cd /var/www/html/
sudo rm -rf index.html
sudo rm -rf chefinstallation.sh Docs LICENSE Readme.MD
sudo mv E-Commerce\ Application/*  ./
sudo rm -rf E-Commerce\ Application
```

### Configuring Database

```
mysql                                                                               # Accessing MySQL
MariaDB > CREATE DATABASE commercedb;                                               # Creating database
```

To check whether the database has been created use
```
show databases;
```

Continuing on

```
MariaDB > CREATE USER 'commerceuser'@'localhost' IDENTIFIED BY 'commercepassword' ;     # Creating user
MariaDB > GRANT ALL PRIVILEGES ON *.* TO 'commerceuser'@'localhost' ;                   # Granting access
MariaDB > FLUSH PRIVILEGES ;                                                            # Flush all privileges
MARIADB > exit ;                                                                        # Exiting from MariaDB
```

Then go into the assests directory in LinuxProjects/Ecommerce Application folder

```
mysql < /var/www/html/assets/db-data.sql                                                                     # Loading the inventory data inside the script
```

To validate if the data has been properly stored inside your database run the following commands

```
mysql
show databases;
USE commercedb;
select * from products;
```

The product list will appear showing that the data was properly loaded

### Installing and configuring httpd

```
sudo yum install -y httpd php php-mysqlnd                                         # php-mysql is a package to allow php to connect to mysql
sudo firewall-cmd --permanent --zone=public --add-port=80/tcp                   # Adding firewall rule to allow external access to port 80
sudo firewall-cmd --reload   
```

Check whether the new rule is in place or not
```
sudo firewall-cmd --list-all
```
This will show the 80 in the port tab, indicating that the new rule is in place

```
sudo service httpd start
sudo systemctl enable httpd
```

To check whether the service is active and running

```
sudo service httpd status
```
### Update index.php file

```
vi index.php
or simply
sudo sed -i 's/172.20.1.101/localhost/g' /var/www/html/index.php

```

In this line $link = mysqli_connect('ip address', 'commerceuser', 'commercepassword', 'commercedb');
replace ip address with localhost since we are doing it on a single node.

### Testing 

```
curl http://localhost
```  
  
## Single Node Deployment
  
The above method deploys the LAMP stack on the single node, meaning we installed and configured database, apache and php on the same node.

## Multi Node Deployment
  
To perform multinode deployment the database must be installed on one node and the webserver and php on other. The rest of the setup is same. One must also configure the index.php on the webserver with the ip address of the database server. Modify this line

```
$link = mysqli_connect('localhost', 'commerceuser', 'commercepassword', 'commercedb');
```

Likewise in the database while creating the user and the access remember to provide the ip address of the database server. For example the following commands should be changed

```
MariaDB > CREATE USER 'ecomuser'@'(ip address of database here)' IDENTIFIED BY 'ecompassword' ;    
MariaDB > GRANT ALL PRIVILEGES ON *.* TO '(ip address of database here)' ;               
```
