# docker-zeppelin setup
created from ubuntu 14.04.4 & zeppelin-0.5.6

Building It.
```
docker build -t docker-zeppelin .
```

Running It
```sh
#!/bin/sh

docker run --name zeppelin \
       -p 0.0.0.0:8080:8080 \
       -v ./data:/data \
       -v ./notebook:/zeppelin-0.5.6-incubating-bin-all/notebook \
       -d docker-zeppelin
```

TODO:
- timezones ?
