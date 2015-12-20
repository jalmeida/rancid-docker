FROM centos:centos7
MAINTAINER Juanma Almeida <juanma.almeida@gmail.com>
RUN yum install -y cvs expect gcc wget git tar crontabs telnet make
RUN cd /root && wget -P /root/ ftp://ftp.shrubbery.net/pub/rancid/rancid-3.2.tar.gz
RUN cd /root && tar xzvf /root/rancid-3.2.tar.gz
RUN groupadd netadm
RUN useradd -g netadm -d /home/rancid rancid
RUN cd /root/rancid-3.2 && ./configure --prefix=/home/rancid && make install
RUN cp /root/rancid-3.2/cloginrc.sample /home/rancid/.cloginrc
RUN chmod 0640 /home/rancid/.cloginrc \
        && chmod u+x /home/rancid/.bashrc \
        && chown -R rancid:netadm /home/rancid/ \
        && chmod 770 /home/rancid/
RUN echo 'rancid:rancid' |chpasswd
RUN echo 'root:rancid' |chpasswd
VOLUME ["/home/rancid/var/", "/home/rancid/etc/"]
ENV PATH /usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/home/rancid/bin/
ENV HOME /home/rancid
ADD ./config/startup.sh /home/rancid/startup.sh
CMD ["/bin/bash", "/home/rancid/startup.sh"]
