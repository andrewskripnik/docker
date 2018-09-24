FROM oraclelinux:7-slim

LABEL maintainer="Andrew Skripnik"

LABEL io.k8s.description="Platform for running java apps" \
      io.k8s.display-name="Centos 7 openjdk 1.8" \
#      io.openshift.expose-services="8080:http" \
      io.openshift.tags="jdk1.8,jdk8"

ENV BUILD_VERSION v1.0.0
ENV JAVA_VERSION openjdk-1.8.0


RUN yum remove -y git libxml2-devel lsof mariadb-devel mariadb-libs postgresql-devel sqlite-devel yum-utils wget gettext gcc-c++ && \
    yum install -y java-1.8.0-openjdk && yum clean all -y && rm -rf /var/cache/yum && \
    mkdir -p /opt/app-root

ENV JAVA_HOME /usr/lib/jvm/java-openjdk

RUN chown -R 1001:1001 /opt/app-root

COPY docker-entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]

EXPOSE 8083

CMD ["/bin/bash -c "]

