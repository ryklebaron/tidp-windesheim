#!/bin/bash

/etc/init.d/apache2 start
# Start een shell voor interactive 
/bin/bash

service ssh restart
# Tail de access log om de container draaiende te houden
tail -f /var/log/apache2/access.log
