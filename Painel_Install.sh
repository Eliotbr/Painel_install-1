#!/bin/bash
rm /etc/localtime && ln -s /usr/share/zoneinfo/America/Sao_Paulo /etc/localtime
apt-get update
#apt-get upgrade -y
apt-get install curl -y
apt-get install apache2 -y
apt-get install php5 libapache2-mod-php5 php5-mcrypt -y
apt-get install mysql-server -y
#  mysql_install_db
mysql_secure_installation
apt-get install phpmyadmin -y
php5enmod mcrypt
service apache2 restart
ln -s /usr/share/phpmyadmin /var/www/html/phpmyadmin
apt-get install libssh2-1-dev libssh2-php -y
php -m |grep ssh2
cd 
apt-get install unzip
rm -rf painelssh.zip
wget https://github.com/matheuslarcher20/Install/raw/master/painelssh.zip
mv painelssh.zip /var/www/html/
cd /var/www/html
unzip painelssh.zip
rm painelssh.zip index.html
read -p "Senha para mysql e Banco de dados: " SENHA
mysql -h localhost -u root -p$SENHA -e "CREATE DATABASE ssh"
service apache2 restart
clear
echo "
 1 - abra o arquivo pass.php e digite sua senha. Ex: <?php $pass = 'SUA_SENHA';?> 
 nano /var/www/html/pages/system/pass.php"
echo "
2 - Acesse: $IP/phpmyadmin E crie um Banco de Dados SSH
 
3 - Dentro da VPS digite: crontab -e
escolha a opcao NANO e cole no arquivo os comanda abaixo:
 
* * * * * /usr/bin/php /var/www/html/pages/system/cron.php
* * * * * /usr/bin/php /var/www/html/pages/system/cron.ssh.php
* * * * * /usr/bin/php /var/www/html/pages/system/cron.sms.php
* * * * * /usr/bin/php /var/www/html/pages/system/cron.online.ssh.php
10 * * * * /usr/bin/php /var/www/html/pages/system/cron.servidor.php

service apache2 restart
  
    ******Final*******"
 
 rm -rf Painel_Install.sh