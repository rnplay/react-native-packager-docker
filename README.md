### React Native docker container for packaging apps

Run the React Native packager in an isolated Docker enviroment, under Debian with iojs. In use on rnplay.org.

### Usage

Build:

```
% docker build -t rn-packager .
```

Run with a Docker volume where your app javascript lives:

```
% docker run -v /path/to/js:/js rn-packager
```

### Use in development on OS X

You can use this to run your packager in development on OS X.

However, to pick up changes to files on your Mac filesystem, you'll need a way
to get files into the Docker container. Shared folders are slow and don't trigger
changes in watchman.

[Docker-osx-dev](https://github.com/brikis98/docker-osx-dev) is one solution that uses rsync for mounted volumes.
