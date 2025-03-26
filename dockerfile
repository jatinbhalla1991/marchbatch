from ubuntu
run apt-get update
run apt-get -y install apache2
add . /var/www/html
expose 80
cmd apachectl -D FOREGROUND