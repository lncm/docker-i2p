FROM debian:buster

# make sure the package repository is up to date
#RUN echo "deb http://deb.i2p2.no/ trusty main" >> /etc/apt/sources.list.d/i2p.list

RUN apt-get update && \
    apt-get install curl ca-certificates gpg -y

RUN curl -o i2p-debian-repo.key.asc https://geti2p.net/_static/i2p-debian-repo.key.asc && \
    apt-key add i2p-debian-repo.key.asc

RUN echo "deb https://deb.i2p2.de/ buster main" >> /etc/apt/sources.list.d/i2p.list

RUN apt-get update
RUN apt-get -y --force-yes install i2p
RUN sed -i s/RUN_DAEMON=\"false\"/RUN_DAEMON=\"true\"/ /etc/default/i2p
RUN /etc/init.d/i2p start
RUN echo "i2cp.tcp.bindAllInterfaces=true" >> /var/lib/i2p/i2p-config/router.config

# Allow persistent config
VOLUME ["/var/lib/i2p/i2p-config"]

EXPOSE 7657
EXPOSE 4444
EXPOSE 4445
CMD /etc/init.d/i2p start && tail -f /var/log/i2p/wrapper.log
