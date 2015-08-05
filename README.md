### React Native docker container for packaging apps

Package your React Native apps with Docker on Ubuntu. Why not?

### Usage

Build:

```
% docker build -t rn-packager .
```

Run with a Docker volume where your app javascript lives:

```
% docker run -v /path/to/js:/js rn-packager
```

### Use in development

You can use this to run your packager in development on OS X.

However, to pick up changes to files on your Mac filesystem, you'll need a way
to get files into the Docker container. Shared folders are slow and don't trigger
for watchman.

[Docker-osx-dev](https://github.com/brikis98/docker-osx-dev) is one solution that uses rsync for mounted volumes.
