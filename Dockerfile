FROM xataz/alpine:3.7

ARG RUNDECK_VER=2.11.2

LABEL description="rundeck based on alpine" \
      tags="latest 2.11.2 2.11 2" \
      maintainer="xataz <https://github.com/xataz>" \
      build_ver="201805110600"

ENV URI_ACCESS="http://localhost:4440" \
    ADMIN_PASSWORD="4dM!n" \
    USER_NAME="user" \
    USER_PASSWORD="U53r" \
    UID=991 \
    GID=991

RUN BUILD_DEPS="wget" \
    && apk add -U openjdk8-jre \
                    libressl \
                    ca-certificates \
                    openssh-client \
                    su-exec \
                    tini \
                    ${BUILD_DEPS} \
    && mkdir -p /rundeck/bin \
    && wget http://dl.bintray.com/rundeck/rundeck-maven/rundeck-launcher-${RUNDECK_VER}.jar -O /rundeck/bin/rundeck.jar \
    && apk del ${BUILD_DEPS} \
    && rm -rf /tmp/* /var/cache/apk/*

EXPOSE 4440
ADD rootfs /
RUN chmod +x /usr/local/bin/startup

ENTRYPOINT ["/usr/local/bin/startup"]
CMD ["java", "-jar", "/rundeck/bin/rundeck.jar", "-b", "/rundeck"]
