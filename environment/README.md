###NLRobots architecture

NLRobots is built on Ubuntu as it is one of the most widely used server software with the least overhead.
PHP7 is used for the backend. 7 specifically because of its speed.
MySQL is used for for the SAP and web-store database and could be used for the MultiVAC database as well (in a EAV schema),
the reason for using MySQL is the relational structure of the SAP and store data.

###Configured using PuPHPet
Provider: VirtualBox
OS: Ubuntu Trusty 14.04 LTS x32 (PHP 7, 5.6, 5.5, HHVM)
Internal Identifier: nlrobots
Hostname: nlrobots.puphpet
IP: 192.168.56.101

Host port:8786
VM Port: 22

Folder target: /var/www

Server: Apache
Server Name: nlrobots.corp
Server Alias: www.nlrobots.corp
Document Root: /var/www/nlrobots
Port: 80

PHP Version 7
Composer installed

###mySQL
All passwords for NLRobots are generated according to the following
philosophy:
https://xkcd.com/936/
Passwords can be generated using the following link (click on xkcd as a filter):
https://xkpasswd.net/s/

Root Password: milk-TWELVE-SORRY-hundred
Username: admin
Admin password: URANUS-TOWN-actually-HAPPENED
