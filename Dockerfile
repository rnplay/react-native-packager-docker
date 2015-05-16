FROM ubuntu:14.04

RUN apt-get update
RUN apt-get -y install software-properties-common git build-essential
RUN add-apt-repository -y ppa:chris-lea/node.js
RUN apt-get update
RUN apt-get install -y nodejs git-core automake

RUN git clone https://github.com/facebook/watchman.git /tmp/watchman
WORKDIR /tmp/watchman
RUN ./autogen.sh
RUN ./configure
RUN make
RUN make install

ADD build-package.json /tmp/package.json
RUN cd /tmp && npm install
RUN mkdir -p /app && cp -a /tmp/node_modules /app/

ADD ./ /app
WORKDIR /app

RUN npm install

RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

EXPOSE 8081

CMD ["nodejs", "node_modules/react-native/packager/packager.js", "--root", "/js", "--port", "8081"]
