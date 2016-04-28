FROM node

RUN apt-get update && apt-get install -y redis-server

COPY . /hubot/
WORKDIR /hubot/
RUN npm i \
  && chmod +x /hubot/bin/hubot

CMD bin/hubot --adapter slack
