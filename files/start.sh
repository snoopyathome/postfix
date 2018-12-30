#!/bin/sh
rsyslogd
rm /etc/aliases* /etc/postfix/transport*
cp /defaults/*.cf /etc/postfix/
cp /configuration/aliases /etc/aliases
sed -i "s/SERVICENAME/${SERVICENAME}/g" /etc/postfix/main.cf
echo -e $MYNETWORKS >> /etc/postfix/main.cf
postmap /etc/aliases
/usr/sbin/postfix -c /etc/postfix start
tail -F /var/log/maillog
