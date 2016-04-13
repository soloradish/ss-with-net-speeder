# shadowsocks-net-speeder

FROM ubuntu:14.04.3
MAINTAINER lowid <lowid@outlook.com>
RUN apt-get update && \
    apt-get install -y python-pip libnet1 libnet1-dev libpcap0.8 libpcap0.8-dev git

RUN pip install shadowsocks==2.8.2

RUN git clone https://github.com/snooda/net-speeder.git net-speeder
WORKDIR net-speeder
RUN sh build.sh

RUN mv net_speeder /usr/local/bin/
RUN nohup net_speeder venet0 "ip" >/dev/null 2>&1 &
RUN echo 'nohup net_speeder venet0 "ip" >/dev/null 2>&1 &' >> /etc/rc.local


# Configure container to run as an executable
ENTRYPOINT ["nohup net_speeder venet0 'ip' >/dev/null 2>&1 & && /usr/local/bin/ssserver"]
