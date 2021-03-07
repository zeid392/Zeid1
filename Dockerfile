FROM ubuntu
ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install -y \
    apache2
CMD ["apache2","-DFOREGROUND"]

RUN sed -i 's/Listen 80/Listen 6000/' /etc/apache2/ports.conf
ENTRYPOINT ["/usr/sbin/apache2ctl"]
CMD ["-D", “FOREGROUND”, “-k”, “start”]
