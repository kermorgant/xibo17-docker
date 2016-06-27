# Docker config for Xibo CMS

This image contains php-fpm and xibo 1.7.

It isn't meant to work as a standalone container, so you'll need at least a web server and a mariadb/mysql database.

You can check my [github repo kgdocks](https://github.com/kermorgant/xibo-docker) to get those missing pieces, although you'll have to remove some other unneeded services. Just keep :

* nginx : edit the Dockerfile and comment the unneeded COPY instructions. Edit also entrypoint.sh accordingly.

* mariadb

* syslog
