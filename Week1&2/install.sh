#!/bin/bash

# Update package list
sudo apt update

# Install NGINX
sudo apt install -y nginx

# Install MySQL and secure installation
sudo apt install -y mysql-server
sudo mysql_secure_installation

# Install PHP and required extensions
sudo apt install -y php-fpm php-mysql

# Configure NGINX to use PHP
sudo mv /etc/nginx/sites-available/default /etc/nginx/sites-available/default_backup
sudo bash -c 'cat > /etc/nginx/sites-available/default <<EOF
server {
    listen 80 default_server;
    listen [::]:80 default_server;

    root /var/www/html;
    index index.php index.html index.htm index.nginx-debian.html;

    server_name _;

    location / {
        try_files $uri $uri/ =404;
    }

    location ~ \.php$ {
        include snippets/fastcgi-php.conf;
        fastcgi_pass unix:/var/run/php/php7.4-fpm.sock;
        fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
        include fastcgi_params;
    }

    location ~ /\.ht {
        deny all;
    }
}
EOF'

# Reload NGINX to apply changes
sudo systemctl reload nginx

# Create a test PHP file
echo "<?php phpinfo(); ?>" | sudo tee /var/www/html/info.php

# Install WordPress
sudo apt install -y unzip
wget https://wordpress.org/latest.zip
unzip latest.zip
sudo mv wordpress/* /var/www/html/
sudo chown -R www-data:www-data /var/www/html/

# Cleanup
rm -rf wordpress latest.zip

# Provide instructions to the user
echo "NGINX, MySQL, PHP, and WordPress have been installed successfully."
