FROM amazonlinux:2.0.20200406.0

ARG ETCD_VER=v3.4.8
ARG GITHUB_URL=https://github.com/etcd-io/etcd/releases/download
ARG DOWNLOAD_URL=${GITHUB_URL}

RUN yum install tar gzip -y

RUN mkdir /tmp/etcd && \
    curl -L ${DOWNLOAD_URL}/${ETCD_VER}/etcd-${ETCD_VER}-linux-amd64.tar.gz -o /tmp/etcd-${ETCD_VER}-linux-amd64.tar.gz && \
    tar xzvf /tmp/etcd-${ETCD_VER}-linux-amd64.tar.gz -C /usr/local/bin/ --strip-components=1

EXPOSE 2380 2379
