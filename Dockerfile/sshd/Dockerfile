FROM centos:centos7
MAINTAINER KD <kuldeeparyadotcom@gmail.com>

RUN yum -y update && yum install -y initscripts openssh openssh-server openssh-clients sudo passwd sed screen tmux byobu which vim-enhanced tar wget
RUN sshd-keygen
RUN sed -i "s/#UsePrivilegeSeparation.*/UsePrivilegeSeparation no/g" /etc/ssh/sshd_config && sed -i "s/UsePAM.*/UsePAM no/g" /etc/ssh/sshd_config

RUN useradd admin -G wheel -s /bin/bash -m
RUN echo 'admin:welcome' | chpasswd
RUN echo '%wheel ALL=(ALL) ALL' >> /etc/sudoers

#Download & Installing JRE 8
RUN wget --no-cookies --no-check-certificate --header "Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com%2F; oraclelicense=accept-securebackup-cookie" "http://download.oracle.com/otn-pub/java/jdk/8u77-b03/jre-8u77-linux-x64.rpm"
RUN yum -y localinstall jre-8u77-linux-x64.rpm

#Clean up downloaded files
RUN rm -rf jre-8u77-linux-x64.rpm

EXPOSE 22
CMD ["/usr/sbin/sshd","-D"]
