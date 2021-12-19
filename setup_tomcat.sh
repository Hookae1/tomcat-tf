#!/bin/bash

#Install tomcat
sudo apt-get update
sudo apt-get install tomcat9 tomcat9-admin

#Download sample.war
wget https://tomcat.apache.org/tomcat-7.0-doc/appdev/sample/sample.war

#Stop tomcat
sudo systemctl stop tomcat9

#Setup sample.war 
sudo mv sample.war /var/lib/tomcat9/webapps/ && sudo rm -rf ROOT && sudo mv sample ROOT

#Start tomcat
sudo systemctl start tomcat9 & sudo systemctl enable tomcat9
