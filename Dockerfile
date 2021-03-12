FROM node:lts-alpine

WORKDIR /talks

ADD package.json .

ADD yarn.lock .

RUN yarn

ADD . .

EXPOSE 8000 35729

CMD yarn start