Using the latest and greatest versions is fine, but in practise you may have the need to use a specific application version. Here image tags come into play. 
Issue the following command to pull the version 1.10 of Nginx:

`docker pull nginx:1.10-alpine`{{execute}}

Verify that the image has been stored locally:

`docker images`{{execute}}

What happened? The Docker daemon contacted the default registry ([Dockerhub](https://hub.docker.com)) and checked, whether an image exists with the name `nginx` and the tag `1.10-alpine`.

Note the `-alpine` extension: Most images specify the OS variant of the base image in their tags. Here Nginx runs on an Alpine Linux images. We'll cover the OS base images later.