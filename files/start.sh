#!/bin/sh
rm /etc/postfix/transport*
cp /defaults/* /etc/postfix/
sed -i "s/SERVICENAME/${SERVICENAME}/g" /etc/postfix/main.cf
sed -i "s/VIRTUALMAILBOXDOMAINS/${VIRTUALMAILBOXDOMAINS}/g" /etc/postfix/main.cf
echo -e $MYNETWORKS >> /etc/postfix/main.cf
postmap /etc/postfix/virtual
/usr/sbin/postfix -c /etc/postfix start-fg
