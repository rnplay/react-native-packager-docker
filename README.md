Run the React Native packager in Docker.

Currently runs under Debian with iojs.

### Usage

Build:

```
% sudo ./build -v 0.8.0-rc.2
```

Run with a Docker volume where your app javascript lives:

```
% sudo docker run -p 8081:8081 -v /path/to/js:/app/js packager:0.8.0-rc.2
```

The packager is now listening on port 8081.

To access the bundle of your application:
http://localhost:8081/index.ios.bundle

### Use in development in OS X

To pick up changes to files on your Mac filesystem, you'll need a way
to get files into the Docker container. Shared folders are slow and don't trigger
for watchman.

[Docker-osx-dev](https://github.com/brikis98/docker-osx-dev) is one solution that uses rsync for mounted volumes.
