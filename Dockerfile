FROM alpine:3.8
RUN echo 'https://mirrors.aliyun.com//alpine/v3.8/main' > /etc/apk/repositories && echo 'https://mirrors.aliyun.com//alpine/v3.8/community' >> /etc/apk/repositories

ARG AEON='ON'
ARG HTTPD='ON'
ARG LIBCPUID='ON'
ARG RELEASE='v2.8.3'

WORKDIR /data
RUN apk update &&\
  apk add --no-cache \
    build-base \
    cmake \
    curl \
    openssl-dev \ 
    libuv-dev && \
  if [ "${HTTPD}" == 'ON' ]; then apk add libmicrohttpd-dev; fi && \
  curl -sSLo xmrig.tar.gz https://github.com/xmrig/xmrig/archive/${RELEASE}.tar.gz && \
  tar --strip-components=1 -xzf xmrig.tar.gz && \
  mkdir build && cd build && \
  cmake \
    -DCMAKE_BUILD_TYPE=Release \
    -DWITH_LIBCPUID="${LIBCPUID}" \
    -DWITH_AEON="${AEON}" \
    -DWITH_HTTPD="${HTTPD}" \
    -DWITH_LIBCPUID="${LIBCPUID}" \
    .. && \
  make && \
  mv xmrig /usr/bin && \
  apk del \
    build-base \
    cmake \
    curl && \
  rm -rf /tmp/* && \
  rm -rf /var/cache/apk/*


ENTRYPOINT ["xmrig"]
