#!/bin/sh
sudo cp supervisord.conf /etc/supervisor/conf.d/supervisord.conf
sudo cp 000-default.conf /etc/apache2/sites-available/000-default.conf
sudo cp httpd.conf /etc/apache2/httpd.conf
sudo a2enmod include
sudo a2enmod rewrite
sudo a2enmod cgi


sudo service apache2 restart
sudo service apache2 stop

sudo /usr/bin/supervisord
