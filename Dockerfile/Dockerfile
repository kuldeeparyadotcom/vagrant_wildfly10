FROM centos:centos7
MAINTAINER KD

RUN yum -y update && yum install -y initscripts openssh openssh-server openssh-clients sudo passwd sed screen byobu which vim-enhanced tar wget

RUN useradd -md /home/wildfly -s /bin/bash -G wheel wildfly
RUN echo 'wildfly:welcome' | chpasswd
RUN echo '%wheel ALL=(ALL) ALL' >> /etc/sudoers

WORKDIR /home/wildfly

#Download & Installing JRE 8
RUN wget --no-cookies --no-check-certificate --header "Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com%2F; oraclelicense=accept-securebackup-cookie" "http://download.oracle.com/otn-pub/java/jdk/8u77-b03/jre-8u77-linux-x64.rpm"
RUN yum -y localinstall jre-8u77-linux-x64.rpm

#Download and Install Wildfly 10
RUN wget http://download.jboss.org/wildfly/10.0.0.Final/wildfly-10.0.0.Final.tar.gz
RUN tar zxvf wildfly-10.0.0.Final.tar.gz

#Clean up downloaded files
RUN rm -rf wildfly-10.0.0.Final.tar.gz
RUN rm -rf jre-8u77-linux-x64.rpm

#Backup Original deployments directory
RUN cp -R /home/wildfly/wildfly-10.0.0.Final/standalone/deployments /home/wildfly

VOLUME ["/home/wildfly/wildfly-10.0.0.Final/standalone/deployments"]

CMD ["/home/wildfly/wildfly-10.0.0.Final/bin/standalone.sh", "-b", "0.0.0.0", "-bmanagement", "0.0.0.0"]

EXPOSE 8080
EXPOSE 9990
