In this step we will consider `EXPOSE`

### `EXPOSE`

With the `EXPOSE` keyword one or more ports will be exposed to enable the communication between the container and the outside.

In our example we construct a very simplistic web server (not recommended for production);

<pre class="file" data-filename="Dockerfile" data-target="replace">FROM alpine:latest

ADD entrypoint.sh /
RUN chmod +x /entrypoint.sh

EXPOSE 8080

CMD ["/entrypoint.sh"]
</pre>

Build and run:

`docker build  -t dockerfundamentals-nc:alpine . && docker run -d -p 80:8080:1234 dockerfundamentals-nc:alpine`{{execute}}

Test whether the port is accessible from outside:

https://[[HOST_SUBDOMAIN]]-1234-[[KATACODA_HOST]].environments.katacoda.com/

