FROM ubuntu:12.04

MAINTAINER nimmis <kjell.havneskold@gmail.com>

# disable interactive functions
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get install  -y --no-install-recommends git ca-certificates && \
    # Create autorun directories
    mkdir /etc/my_runonce && mkdir /etc/my_runalways && \
    # moved all configuration to separate git repository
    git clone https://github.com/nimmis/docker-utils.git && \
    # run os fixes for Ubuntu
    docker-utils/ubuntu/root/fix.sh && \
    # copy configuration files and commands to disk
    cp -p docker-utils/ubuntu/bin/* /usr/local/bin/ && \
    cp -p docker-utils/ubuntu/my_runonce/* /etc/my_runonce/ && \
    cp -p docker-utils/ubuntu/root/my* / && \
    cp -pR docker-utils/ubuntu/supervisor /etc/ && \
    # add missing direcotry for syslog-ng
    mkdir /var/lib/syslog-ng && \
    # remove repository from image
    rm -Rf docker-utils && \
    # remove extra space from git command
    apt-get remove -y git && \
    apt-get autoremove -y && \
    # remove apt cache from image
    apt-get clean all

# Set environment variables.
ENV HOME /root

# Define working directory.
WORKDIR /root

# Define default command.
CMD ["/my_init"]
