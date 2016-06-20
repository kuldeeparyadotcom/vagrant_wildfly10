FROM centos:centos7
MAINTAINER KD <kuldeeparyadotcom@gmail.com>

RUN yum -y update && yum install -y initscripts openssh openssh-server openssh-clients sudo passwd sed screen tmux byobu which vim-enhanced
RUN sshd-keygen
RUN sed -i "s/#UsePrivilegeSeparation.*/UsePrivilegeSeparation no/g" /etc/ssh/sshd_config && sed -i "s/UsePAM.*/UsePAM no/g" /etc/ssh/sshd_config

RUN useradd admin -G wheel -s /bin/bash -m
RUN echo 'admin:welcome' | chpasswd
RUN echo '%wheel ALL=(ALL) ALL' >> /etc/sudoers

EXPOSE 22
CMD ["/usr/sbin/sshd","-D"]
