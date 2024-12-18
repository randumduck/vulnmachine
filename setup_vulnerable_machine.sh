#!/bin/bash

# Update and upgrade the system
sudo apt-get update -y
sudo apt-get upgrade -y

# Install vulnerable versions of applications
# Note: Some of these versions may not be available in the default repositories and might require manual installation or custom repositories.

# Install a vulnerable version of OpenSSH
sudo apt-get install -y openssh-server=1:7.2p2-4ubuntu2.10

# Install a vulnerable web server (Apache)
sudo apt-get install -y apache2=2.4.18-2ubuntu3.14

# Install a vulnerable version of PHP
sudo apt-get install -y php=7.0.33-0ubuntu0.16.04.16

# Install a vulnerable version of MySQL
sudo apt-get install -y mysql-server=5.7.31-0ubuntu0.16.04.1

# Install a vulnerable version of FTP server (vsftpd)
sudo apt-get install -y vsftpd=3.0.3-3ubuntu2

# Install a vulnerable version of Samba
sudo apt-get install -y samba=2:4.3.11+dfsg-0ubuntu0.16.04.30

# Install additional vulnerable applications
sudo apt-get install -y phpmyadmin=4:4.5.4.1-2ubuntu2
sudo apt-get install -y wordpress=4.4+dfsg-1
sudo apt-get install -y drupal7=7.54-2

# Create a vulnerable web application directory
sudo mkdir -p /var/www/html/vulnerable_app
echo "<?php echo 'Vulnerable PHP App'; ?>" | sudo tee /var/www/html/vulnerable_app/index.php

# Configure Apache to serve the vulnerable application
sudo bash -c 'cat <<EOF > /etc/apache2/sites-available/vulnerable_app.conf
<VirtualHost *:80>
    DocumentRoot /var/www/html/vulnerable_app
    <Directory /var/www/html/vulnerable_app>
        AllowOverride All
        Require all granted
    </Directory>
</VirtualHost>
EOF'

sudo a2ensite vulnerable_app
sudo systemctl reload apache2

# Create a vulnerable MySQL user and database
sudo mysql -e "CREATE DATABASE vulnerable_db;"
sudo mysql -e "CREATE USER 'vulnerable_user'@'localhost' IDENTIFIED BY 'vulnerable_password';"
sudo mysql -e "GRANT ALL PRIVILEGES ON vulnerable_db.* TO 'vulnerable_user'@'localhost';"
sudo mysql -e "FLUSH PRIVILEGES;"

# Create a vulnerable Samba share
sudo bash -c 'cat <<EOF >> /etc/samba/smb.conf
[vulnerable_share]
    path = /srv/samba/vulnerable_share
    read only = no
    browsable = yes
EOF'

sudo mkdir -p /srv/samba/vulnerable_share
sudo chmod 777 /srv/samba/vulnerable_share
sudo systemctl restart smbd

# Install other tools that might be useful for testing
sudo apt-get install -y netcat nmap

# Install DVWA (Damn Vulnerable Web Application)
sudo git clone https://github.com/digininja/DVWA.git /var/www/html/dvwa
sudo chown -R www-data:www-data /var/www/html/dvwa
sudo mysql -e "CREATE DATABASE dvwa;"
sudo mysql -e "CREATE USER 'dvwa_user'@'localhost' IDENTIFIED BY 'dvwa_password';"
sudo mysql -e "GRANT ALL PRIVILEGES ON dvwa.* TO 'dvwa_user'@'localhost';"
sudo mysql -e "FLUSH PRIVILEGES;"
sudo cp /var/www/html/dvwa/config/config.inc.php.dist /var/www/html/dvwa/config/config.inc.php
sudo sed -i "s/'db_user' => 'root'/'db_user' => 'dvwa_user'/g" /var/www/html/dvwa/config/config.inc.php
sudo sed -i "s/'db_password' => ''/'db_password' => 'dvwa_password'/g" /var/www/html/dvwa/config/config.inc.php

# Restart Apache to apply changes
sudo systemctl restart apache2

echo "Vulnerable machine setup complete. Happy hacking!"
