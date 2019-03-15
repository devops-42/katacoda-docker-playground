In this step we will consider `EXPOSE`

### `EXPOSE`

With the `EXPOSE` keyword one or more ports will be exposed to enable the communication between the container and the outside.

In our example we construct a very simplistic web server (not recommended for production);

<pre class="file" data-filename="Dockerfile" data-target="replace">FROM alpine:latest

RUN apk update && \
    apk add netcat-openbsd

EXPOSE 1234

CMD while true ; do  echo -e "HTTP/1.1 200 OK\n\n $(date)" | nc -l -p 1234  ; done
</pre>

Build and run:

`docker build  -t dockerfundamentals-nc:alpine . && docker run -d -p 1234:1234 dockerfundamentals-nc:alpine`{{execute}}

Test whether the port is accessible from outsid:

https://[[HOST_SUBDOMAIN]]-1234-[[KATACODA_HOST]].environments.katacoda.com/

