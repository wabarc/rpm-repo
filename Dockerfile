FROM centos:8

RUN yum install -y createrepo

COPY entrypoint.sh /

CMD ["/bin/sh", "/entrypoint.sh"]
