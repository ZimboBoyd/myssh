FROM fedora
MAINTAINER http://fedoraproject.org/wiki/Cloud

EXPOSE 22

RUN yum -y install \
	openssh-server \
	passwd \
	; yum clean all

RUN  useradd user

COPY keys/auth* /home/user/.ssh/
COPY keys/id_server* /home/user/.ssh/

COPY entrypoint.sh /entrypoint.sh
COPY client.sh /client.sh

ENTRYPOINT ["/entrypoint.sh"]
CMD ["/usr/sbin/sshd", "-D"]
