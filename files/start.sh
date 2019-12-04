#!/bin/sh
rsyslogd
rm /etc/aliases* /etc/postfix/transport*
cp /defaults/*.cf /etc/postfix/
/configuration/users.sh
saslauthd -a shadow
cp /configuration/aliases /etc/aliases
sed -i "s/SERVICENAME/${SERVICENAME}/g" /etc/postfix/main.cf
sed -i "s/DESTINATION/${DESTINATION}/g" /etc/postfix/main.cf
echo -e $MYNETWORKS >> /etc/postfix/main.cf
postalias /etc/aliases
/usr/sbin/postfix -c /etc/postfix start
tail -F /var/log/mail.log
