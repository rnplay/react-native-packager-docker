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
