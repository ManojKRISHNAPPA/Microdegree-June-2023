#!/bin/bash
sudo yum update
sudo yum install httpd -y
sudo systemctl enable httpd
sudo systemctl start httpd
echo "<h1> hello guys this is our last class </h1>" >> sudo /var/www/html/index.html
