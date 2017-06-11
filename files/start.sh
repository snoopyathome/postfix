#!/bin/sh
rsyslogd
rm /etc/aliases* /etc/postfix/transport*
cp /defaults/* /etc/postfix/
sed -i "s/SERVICENAME/${SERVICENAME}/g" /etc/postfix/main.cf
echo -e $MYNETWORKS$RELAYDOMAINS >> /etc/postfix/main.cf
echo -e $TRANSPORT > /etc/postfix/transport
postmap /etc/postfix/transport
touch /etc/aliases
postmap /etc/aliases
/usr/sbin/postfix -c /etc/postfix start
tail -F /var/log/maillog
