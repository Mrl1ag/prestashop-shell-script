#!/bin/bash
#instalar banco do prestashop

sudo mysql -h "localhost" -u root < "criar_banco.sql"

#mysql -h "localhost" -u "maramar" -p"Maramar1234*" < "criar_banco.sql" 

#instalar dependencias PHP

sudo apt update
sudo apt install -y php-common php-mbstring php-gd php-intl \
php-xml php-mysql php-zip php-curl php-xmlrpc curl libapache2-mod-php7.4 php-fpm php7.4-fpm

echo criar diretório

sudo mkdir /var/www/dandara.net/prestashop

echo arquivos de configuração apache

sudo cp /home/maria/install/arquivo_apache.conf /etc/apache2/sites-available/loja.dandara.net.conf

echo Apache

sudo apache2ctl configtest
sudo a2enmod rewrite headers proxy_fcgi setenvif
sudo a2enconf php7.4-fpm
sudo a2ensite loja.dandara.net.conf
sudo systemctl reload apache2

#arquivo http
echo ""
echo instalando Prestashop

cd ~ 
curl -0 https://download.prestashop.com/download/releases/prestashop_1.7.8.0.zip -o /home/maria/prestashop.zip
sudo apt-get install unzip
sudo unzip -o prestashop.zip -d /var/www/dandara.net/prestashop
sudo chown -R www-data:www-data /var/www/dandara.net/prestashop
sudo find /var/www/dandara.net/prestashop/ -type d -exec chmod 755 {} \;
sudo find /var/www/dandara.net/prestashop/ -type f -exec chmod 644 {} \;
