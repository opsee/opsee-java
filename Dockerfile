FROM develar/java:8u45

RUN apk add --update bash curl ca-certificates

RUN cd /tmp && \
  curl -jksSLH "Cookie: oraclelicense=accept-securebackup-cookie"\
  http://download.oracle.com/otn-pub/java/jdk/${JAVA_VERSION_MAJOR}u${JAVA_VERSION_MINOR}-b${JAVA_VERSION_BUILD}/jdk-${JAVA_VERSION_MAJOR}u${JAVA_VERSION_MINOR}-linux-x64.tar.gz | gunzip -c - | tar -xf - && \
  bash -c "cp jdk1.${JAVA_VERSION_MAJOR}.0_${JAVA_VERSION_MINOR}/bin/{jstack,jmap} ${JAVA_HOME}/bin" && \
  apk del curl ca-certificates


ENTRYPOINT ["java", "-Djava.security.egd=file:/dev/urandom"]
