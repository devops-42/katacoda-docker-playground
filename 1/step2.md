Now we‘re going to pull a Nginx image from Dockerhub. Issue the command:

`docker pull nginx`{{execute}}

and see, whether the image has been stored locally:

`docker images`{{execute}}

What happened? The Docker daemon contacted the default registry ([Dockerhub](https://hub.docker.com)) and checked, whether an image exists with the name `nginx`.
We didn‘t specify a special image version, thus Docker requested to pull the `latest` tag.
