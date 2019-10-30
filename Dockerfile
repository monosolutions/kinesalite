FROM node:10-alpine
ARG KINESALITE_VERSION=3.1.0
ENV DATADIR /var/lib/kinesalite
RUN mkdir -p $DATADIR
RUN mkdir /kinesalite
ADD package.json /kinesalite
ADD yarn.lock /kinesalite
WORKDIR /kinesalite
RUN yarn install
EXPOSE 4567
VOLUME $DATADIR
CMD npm run start -- --path ${DATADIR}