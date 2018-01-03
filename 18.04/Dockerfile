FROM ubuntu:18.04

MAINTAINER nimmis <kjell.havneskold@gmail.com>

# disable interactive functions
ENV DEBIAN_FRONTEND noninteractive

COPY root/. /

RUN apt-get update && \

    # install neede packages
    apt-get install  -y --no-install-recommends ca-certificates && \

    # missing tzdata in 18.04 beta

    apt-get install -y tzdata && \
 
    # upgrade OS
    apt-get -y dist-upgrade && \

    # Make info file about this build
    mkdir -p /etc/BUILDS/ && \
    printf "Build of nimmis/ubuntu:18.04, date: %s\n"  `date -u +"%Y-%m-%dT%H:%M:%SZ"` > /etc/BUILDS/ubuntu && \

    # run os fixes for Ubuntu
    /fix.sh && rm -f /fix.sh && \

    apt-get autoremove -y && \

    # remove apt cache from image
    apt-get clean all

# Set environment variables.
ENV HOME /root

# Define working directory.
WORKDIR /root

# Define default command.
CMD ["/my_init"]
