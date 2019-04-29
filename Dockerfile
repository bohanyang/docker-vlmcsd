FROM alpine:3.9

ARG VLMCSD_VERSION=svn1112

RUN set -ex; \
    apk add --no-cache --virtual .build-deps \
        curl \
    ; \
    curl -fsSLO "https://github.com/Wind4/vlmcsd/releases/download/$VLMCSD_VERSION/binaries.tar.gz"; \
    tar -x -f binaries.tar.gz binaries/Linux/intel/musl/vlmcsd-x64-musl; \
    mv binaries/Linux/intel/musl/vlmcsd-x64-musl /usr/local/bin/vlmcsd; \
    rm -r binaries binaries.tar.gz; \
    apk del .build-deps

EXPOSE 1688
CMD ["vlmcsd"]