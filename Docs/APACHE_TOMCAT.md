#### Minimum Installation 
1. sudo apt install default-jdk : To run Java web applications, Tomcat requires Java to be installed on the server. To meet that requirement, we will install OpenJDK as shown. Before Using this command try to update your machine by apt-get update.
2. wget https://downloads.apache.org/tomcat/tomcat-10/v10.0.8/bin/apache-tomcat-10.0.8.tar.gz : Download the installation files
3. tar xvf apache-tomcat-10.0.8.tar.gz : Then you you have to extract the downloaded files
4. ./apache-version/bin/startup.sh : Run startup.sh to start tomcat.
5. http://localhost:8080 : Tomcat runs on port 8080. Run this command on web browser to see the running tomcat webserver.
6. Better practices would have included creating a separate user for tomcat and configuring tomcat as a service.
7. ./apache-version/bin/shutdown.sh : Similarly running this script shutsdown the tomcat server. The batch files are used in Windows for the same purpose. Bin directory stores scripts and batfiles.
8. ls ./apache-version/conf/ : This is where the tomcats configuration files are stored. Here you configure the webserver and the ports. The server.xml has the entry for the connector. The connector is the end poin at which the requests are recieved. It is set to 8080, which is the default port tomcat listens on and it can be modified. Any change here would require the restart of the tomcat service. Similarly web.xml is used to deploy and configure web applications.
9. ls ./apache-version/logs/ : This is where the logs are stored
10. ls ./apache-version/webapps/ : This is where the web applications hosted by tomcat server are located. We package Java webapplications using the war archive since they contain html and css files as well. A good approach is to use maven or gradle to build and package Java files and then move the package to this location. The server will automatically detect the war file and extract it into a directory that matches the packaged name and will host it at the path having the same name like http://localhost:8080/(war file name) 

