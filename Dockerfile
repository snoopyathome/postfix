FROM alpine:3.10

COPY files/start.sh /start.sh

RUN apk add --update ca-certificates postfix postfix-pcre postfix-policyd-spf-perl cyrus-sasl cyrus-sasl-plain cyrus-sasl-login libsasl rsyslog &&\
    echo "policy-spf unix - n n - - spawn user=nobody argv=/usr/bin/postfix-policyd-spf-perl" >> /etc/postfix/master.cf &&\
    chmod +x /start.sh &&\
    rm -rf /var/cache/apk/* 

CMD ["/start.sh"]
