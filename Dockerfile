FROM ubuntu:14.04

RUN apt-get update
RUN apt-get install -y nodejs npm git-core

ADD ./ /app
WORKDIR /app

RUN npm install

RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

EXPOSE 9000

CMD ["nodejs", "node_modules/react-native/packager/packager.js", "--root", "/js"]