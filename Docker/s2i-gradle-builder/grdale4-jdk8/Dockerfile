FROM openshift/base-centos7

LABEL maintainer="Andrew Skripnik"

LABEL io.k8s.description="Platform for building java apps" \
      io.k8s.display-name="builder gradle+java" \
#      io.openshift.expose-services="8080:http" \
      io.openshift.tags="builder,gradle-builder,jdk8-builder"

ENV BUILD_VERSION v1.0.0
ENV JAVA_VERSION openjdk-1.8.0
# TODO: Install required packages here:
RUN yum install -y java-1.8.0-openjdk && yum clean all -y && \
    mkdir -p /opt/openshift && \
    mkdir -p /opt/app-root/source && chmod -R a+rwX /opt/app-root/source && \
    mkdir -p /opt/s2i/destination && chmod -R a+rwX /opt/s2i/destination && \
    mkdir -p /opt/app-root/src && chmod -R a+rwX /opt/app-root/src

ENV GRADLE_VERSION 4.10
RUN curl -sL -0 https://services.gradle.org/distributions/gradle-${GRADLE_VERSION}-bin.zip -o /tmp/gradle-${GRADLE_VERSION}-bin.zip && \
    unzip /tmp/gradle-${GRADLE_VERSION}-bin.zip -d /usr/local/ && \
    rm /tmp/gradle-${GRADLE_VERSION}-bin.zip && \
    mv /usr/local/gradle-${GRADLE_VERSION} /usr/local/gradle && \
    ln -sf /usr/local/gradle/bin/gradle /usr/local/bin/gradle

COPY ./gradle-builder/grdale4-jdk8/s2i/bin/ /usr/libexec/s2i/

LABEL io.openshift.s2i.scripts-url=image:///usr/libexec/s2i

RUN chown -R 1001:1001 /opt/app-root
RUN chown -R 1001:1001 /opt/openshift

USER 1001

CMD ["/usr/libexec/s2i/usage"]
