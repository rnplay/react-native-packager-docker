FROM iojs:2.4.0

RUN apt-get update
RUN apt-get -y install software-properties-common git-core build-essential automake unzip

RUN git clone https://github.com/facebook/watchman.git /tmp/watchman
WORKDIR /tmp/watchman
RUN ./autogen.sh
RUN ./configure
RUN make
RUN make install

ADD build-package.json /tmp/package.json
RUN cd /tmp && npm install || true
RUN mkdir -p /app && cp -a /tmp/node_modules /app/

RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

EXPOSE 8081

WORKDIR /app

CMD ["node", "node_modules/react-native/packager/packager.js", "--root", "/js", "--port", "8081"]
