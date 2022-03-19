#shell script

#!/bin/bash

#instalar  banco do prestashop

#criar banco mysql

$ sudo mysql -u root -p
mysql> CREATE USER 'prestashopuser'@'localhost' IDENTIFIED BY
'm4ri4l4b123';
mysql> CREATE DATABASE prestashop;
mysql> GRANT ALL ON prestashop.* TO 'prestashopuser'@'localhost';
mysql> FLUSH PRIVILEGES;
mysql> EXIT;

#instalar dependencias PHP

$ sudo apt update
$ sudo apt install php-common php-mbstring php-gd php-intl \ php-xml php-mysql php-zip php-curl php-xmlrpc 

#criar diretório

sudo mkdir /var/www/dandara.net/prestashop

#arquivos de configuração apache 

sudo mkdir /etc/apache2/sites-available/loja.dandara.net.conf

#Conteúdo do arquivo

<VirtualHost *:80>
ServerName loja.dandara.net
ServerAdmin <seu_email>
DocumentRoot /var/www/dandara.net/prestashop
Alias /loja/ /var/www/dandara.net/prestashop
<Directory /var/www/dandara.net/prestashop/>
AllowOverride All
212</Directory>
</VirtualHost>

#Apache

$ sudo apache2ctl configtest
$ sudo a2enmod rewrite headers proxy_fcgi setenvif
$ sudo a2enconf php7.3-fpm
$ sudo a2ensite loja.dandara.net.conf
$ sudo systemctl reload apache2

#arquivo http

#instalando Prestashop 

$ cd ~
$ curl -O
https://download.prestashop.com/download/releases/prestashop_1.7.8.0.zip
$ sudo apt-get install unzip
$ unzip prestashop_1.7.8.0.zip
$ sudo unzip prestashop.zip -d /var/www/dandara.net/prestashop
$ sudo chown -R www-data:www-data /var/www/dandara.net/prestashop
$ sudo find /var/www/dandara.net/prestashop/ -type d -exec chmod 755 {}\;
$ sudo find /var/www/dandara.net/prestashop/ -type f -exec chmod 644 {}\;
