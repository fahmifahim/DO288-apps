FROM registry.access.redhat.com/rhscl/httpd-24-rhel7

RUN echo "Hello from INFORMATION" > /var/www/html/info.html

COPY src/ /var/www/html/

EXPOSE 8080

LABEL io.k8s.description="A basic Apache HTTP" io.k8s.display-name="Apache HTTP Server" io.openshift.expose-service="8080:http" io.openshift.tags="apache, httpd"

RUN sed -i "s/Listen 80/Listen 8080/g" /etc/httpd/conf/httpd.conf

USER 1001

CMD run-httpd

