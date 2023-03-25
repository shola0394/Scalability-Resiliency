# Scalability-Resiliency
Create a launch template with a name such as MyUbuntuLaunchTemplate.
Leverage an Ubuntu Server 18.04 LTS (HVM).
Use the Apache web server configuration below:
#!/bin/bash
apt-get update
apt-get install -y apache2
echo "Welcome to my autoscaled website" > index.html
cp index.html /var/www/html
systemctl start apache2
Systemctl enable apache2

Create an AutoScaling Group with a desired capacity of 2, minimum 1 and Maximum 4
Delete 2 instances and observe the behavior.

