FROM ubuntu:14.04.4


# Get Prerequisite
RUN apt-get -y update  && \
    apt-get -y upgrade && \
    apt-get -y install curl software-properties-common python-software-properties python g++ make build-essential apt-transport-https ca-certificates apparmor

RUN add-apt-repository -y ppa:webupd8team/java
RUN echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | sudo /usr/bin/debconf-set-selections
RUN curl -sL https://deb.nodesource.com/setup_5.x | sudo -E bash -
RUN apt-get install -y oracle-java8-installer maven nodejs


# Get Zeppelin
RUN curl -O http://www.us.apache.org/dist/incubator/zeppelin/0.5.6-incubating/zeppelin-0.5.6-incubating-bin-all.tgz
RUN tar xvzf zeppelin-0.5.6-incubating-bin-all.tgz -C /
RUN mv /zeppelin-0.5.6-incubating-bin-all/ /zeppelin
RUN rm zeppelin-0.5.6-incubating-bin-all.tgz


# Expose Some Directories
RUN mkdir /data
VOLUME /data
VOLUME /zeppelin/notebook


WORKDIR /zeppelin

EXPOSE 8080

CMD ["bin/zeppelin.sh", "start"]
