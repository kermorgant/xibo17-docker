# Docker config for Xibo CMS

This image contains php-fpm and xibo 1.7 (see xibo.org.uk).

It isn't meant to work as a standalone container, so you'll need at least a web server and a mariadb/mysql database.

You can check my [github repo kgdocks](https://github.com/kermorgant/kgdocks) to get those missing pieces, although you'll have to remove some other unneeded services in docker-compose's config files. Just keep :

* nginx (and edit its Dockerfile and comment the unneeded COPY instructions. Edit also entrypoint.sh accordingly).

* mariadb

* syslog
