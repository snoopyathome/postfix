#!/bin/sh
rsyslogd
rm /etc/aliases* /etc/postfix/transport*
cp /defaults/* /etc/postfix/
sed -i "s/SERVICENAME/${SERVICENAME}/g" /etc/postfix/main.cf
echo -e $MYNETWORKS$RELAYDOMAINS >> /etc/postfix/main.cf
touch /etc/aliases
postmap /etc/aliases
/usr/sbin/postfix -c /etc/postfix start
tail -F /var/log/maillog
