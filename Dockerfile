FROM ubuntu:14.04.4

##### UBUNTU
# Update Ubuntu and add extra repositories
RUN apt-get -y update
RUN apt-get -y install software-properties-common
RUN apt-get -y install apt-transport-https

RUN apt-get -y update && apt-get -y upgrade

# Install basic commands
RUN apt-get -y install links nano htop git

# Install basic commands
RUN apt-get -y install make

# Install Apache
RUN apt-get -y install apache2
RUN apt-get -y install libapache2-mod-perl2
RUN apt-get -y install php5 libapache2-mod-php5

# Install Supervisor
RUN apt-get install -y supervisor
RUN mkdir -p /var/log/supervisor

# Get LabelMe
RUN git clone https://github.com/CSAILVision/LabelMeAnnotationTool.git LabelMeAnnotationTool
RUN cd LabelMeAnnotationTool; make
RUN cp -a /LabelMeAnnotationTool /var/www/LabelMeAnnotationTool

# Configure Apache
RUN cp  /notebooks/000-default.conf /etc/apache2/sites-available/000-default.conf
RUN cp  /notebooks/httpd.conf /etc/apache2/httpd.conf
RUN a2enmod include
RUN a2enmod rewrite
RUN a2enmod cgi
RUN mkdir -p /var/lock/apache2 /var/run/apache2

# Access at http://127.0.0.1:PORT/LabelMeAnnotationTool/tool.html
# service apache2 restart

# Configure supervisor
RUN cp  /notebooks/supervisord.conf /etc/supervisor/conf.d/supervisord.conf

EXPOSE 80
RUN service apache2 restart
RUN service apache2 stop

CMD ["/usr/bin/supervisord"]
