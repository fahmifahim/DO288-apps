FROM rhscl/httpd-24-rhel7

ENV DOCROOT=/var/www/html

RUN yum install -y --no-docs --disableplugin=subscription-manager && yum clean all --disableplugin=subscription-manager -y && echo "Hello from httpd-paret" >> $DOCROOT/index.html

ONBUILD COPY src/ $DOCROOT/

EXPOSE 80

RUN -rf /run/httpd && mkdir /run/httpd

USER root

CMD /usr/sbin/httpd -DFOREGROUND

