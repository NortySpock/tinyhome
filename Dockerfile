FROM hypriot/rpi-alpine-scratch
MAINTAINER Daniel S.

RUN apk add --update lighttpd \
 && rm -rf /var/cache/apk/*

RUN mkdir -p /var/cache/lighttpd/compress/ \
 && chown -R lighttpd /var/cache/lighttpd/compress/

RUN mkdir -p /var/www/localhost/htdocs /var/log/lighttpd /var/lib/lighttpd

RUN mkdir -p /var/lib/lighttpd

RUN chown -R lighttpd:lighttpd /var/www/localhost/

RUN chown -R lighttpd:lighttpd /var/lib/lighttpd

RUN chown -R lighttpd:lighttpd /var/log/lighttpd

#COPY lighttpd.conf /etc/lighttpd/lighttpd.conf

EXPOSE 80

VOLUME /var/www/localhost/htdocs/

CMD ["lighttpd", "-D", "-f", "/etc/lighttpd/lighttpd.conf"]
