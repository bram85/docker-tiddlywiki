FROM node:5
MAINTAINER Bram Schoenmakers <me@bramschoenmakers.nl>

ENV TW_VERSION 5.1.11
ENV TW_BASE /usr/src/app
ENV TW_NAME wiki
ENV TW_PATH ${TW_BASE}/${TW_NAME}
ENV TW_USER ""
ENV TW_PASSWORD ""

RUN npm install -g tiddlywiki@${TW_VERSION} && mkdir -p ${TW_BASE}

WORKDIR ${TW_BASE}
VOLUME [${TW_PATH}]

ADD ./run-tiddlywiki.sh /usr/local/bin

EXPOSE 8080
CMD ["/usr/local/bin/run-tiddlywiki.sh"]
