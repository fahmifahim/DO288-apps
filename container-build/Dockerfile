# Use the httpd-parent image as base
FROM registry.access.redhat.com/rhscl/httpd-24-rhel7
#FROM quay.io/redhattraining/httpd-parent

#RUN yum install -y --no-docs --disableplugin=subscription-manager httpd && yum clean all --disableplugin=subscription-manager -y && echo "Hello from INFORMATION" > /var/www/html/info.html
#RUN yum install -y httpd && yum clean all -y && echo "Hello from INFORMATION" > /var/www/html/info.html
RUN yum install -y --disableplugin=subscription-manager httpd && yum clean all -y --disableplugin=subscription-manager && echo "Hello from INFORMATION" > /var/www/html/info.html

ONBUILD COPY src/ /var/www/html/

EXPOSE 8080

LABEL io.k8s.description="A basic Apache HTTP" io.k8s.display-name="Apache HTTP Server" io.openshift.expose-service="8080:http" io.openshift.tags="apache, httpd"

RUN sed -i "s/Listen 80/Listen 8080/g" /etc/httpd/conf/httpd.conf

RUN chgrp -R 0 /var/log/httpd /var/run/httpd && chmod -R g=u /var/log/httpd /var/run/httpd

RUN rm rf /run/httpd && mkdir /run/httpd

#USER 1001
USER root

CMD /usr/sbin/httpd -DFOREGROUND

