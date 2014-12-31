FROM ubuntu:12.04

MAINTAINER nimmis <kjell.havneskold@gmail.com>

# disable interactive functions
ENV DEBIAN_FRONTEND noninteractive

#RUN apt-get update && \
#apt-get install -y wget curl zip git vim supervisor && \
#rm -rf /var/lib/apt/lists/*

# Do OS fixes
ADD bin/fix.sh /fix.sh
RUN chmod +x /fix.sh && /fix.sh && rm /fix.sh

# configure supervisor
ADD ./supervisor/supervisord.conf /etc/supervisor/supervisord.conf
ADD ./supervisor/conf.d/crond.conf /etc/supervisor/conf.d/crond.conf
ADD ./supervisor/conf.d/syslog-ng.conf /etc/supervisor/conf.d/syslog-ng.conf


# set init process
ADD bin/init.pl /init.pl
RUN chmod +x /init.pl

# Set environment variables.
ENV HOME /root

# Define working directory.
WORKDIR /root

# Define default command.
CMD ["/init.pl"]

