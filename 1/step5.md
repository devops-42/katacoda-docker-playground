Now we're able to start/stop containers. As we saw in the last example, stopped containers remain in an `Exited` state. If there's no need to keep the stopped container anymore we can removed it. Let's check the current running container:

`docker ps`{{execute}}

Now we stop our `webwithport` container:

`docker stop webwithport`{{execute}}

Verify that the container has stopped:

`docker ps -a`{{execute}}

The `STATUS` column should indicate `Exited`. To delete the container just issue:

`docker rm webwithport`{{execute}}

Docker prints out the name of the deleted container as a confirmation, here: `webwithport`

Verify that the container has removed:

`docker ps -a | grep webwithport`{{execute}}

The container has been removed, but the corresponding image remains. Docker doesn't remove an image automatically, so we have to do it manually. First get the image list and filter the nginx:

`docker images nginx`{{execute}}

Docker should list at least two images:

`REPOSITORY          TAG                 IMAGE ID            CREATED             SIZE
 nginx               latest              881bd08c0b08        4 days ago          109MB
 nginx               1.10-alpine         f94d6dd9b576        2 years ago         54MB`

If we don't need the image `nginx:1.10-alpine` it can be removed with the following command:

`docker rmi nginx:1.10-alpine`{{execute}}

The output should be similar to:

`Untagged: nginx:1.10-alpine
Untagged: nginx@sha256:4aacdcf186934dcb02f642579314075910f1855590fd3039d8fa4c9f96e48315
Deleted: sha256:f94d6dd9b5761f33a21bb92848a1f70ea11a1c15f3a142c19a44ea3a4c545a4d
Deleted: sha256:42b8ca8e560a8e61f5d80886c501a2339527fe3b0a41b215b9fe834b62a0ddbb
Deleted: sha256:b583e5d3c46eb2c0c5aa3fc9ad548c777fdb4284e6567811c1fec9861c1a5110
Deleted: sha256:8c2f8031137d73f6900d1d2d1c4a08870424cb1ef5f234fefc4f9ddb746e4142
Deleted: sha256:9f8566ee5135862dd980160c27bd7721448a6f7f385bbb81f7f001f1b78a5fbf`

Issue the `docker images` command again to verify, whether the specified image has been deleted:

`docker images nginx`{{execute}}`   
