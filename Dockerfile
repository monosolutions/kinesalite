FROM node:10-alpine
ARG KINESALITE_VERSION=3.1.0
ENV DATADIR /var/lib/kinesalite

USER root
RUN mkdir $DATADIR && chown docker:docker $DATADIR
USER docker

RUN npm install kinesalite@${KINESALITE_VERSION}

EXPOSE 4567
VOLUME $DATADIR

ENTRYPOINT ["kinesalite" , " --path", ${DATADIR}]