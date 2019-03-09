In this step Docker is up and running. A first image has been already pulled. You may verify this by issuing the command:

`docker images`{{execute}}

Along other images the `busybox` image should be displayed.

An image name consists of several parts:
- image name: here `busybox`
- tag: specifies a special version, defaults to `latest`

Now we‘re going to pull a Nginx image from Dockerhub. Issue the command:

`docker pull nginx`{{execute}}

and see, whether the image has been stored locally:

`docker images`{{execute}}

What happened? The Docker daemon contacted the default registry ([Dockerhub](https://hub.docker.com)) and checked, whether an image exists with the name `nginx`.
We didn‘t specify a special image version, thus Docker requested to pull the `latest` tag.
