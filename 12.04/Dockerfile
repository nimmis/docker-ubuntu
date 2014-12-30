FROM ubuntu:12.04

MAINTAINER nimmis <kjell.havneskold@gmail.com>

# disable interactive functions
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && \
apt-get install -y wget curl zip git vim supervisor && \
mkdir /var/log/supervisord/ && \
rm -rf /var/lib/apt/lists/*

# configure supervisor
ADD ./supervisor/supervisord.conf /etc/supervisor/supervisord.conf

# Set environment variables.
ENV HOME /root

# Define working directory.
WORKDIR /root

# Define default command.
CMD ["bash"]

