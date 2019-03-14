At first we query a list of all installed Docker images:

`docker images`{{execute}}

Copy the content of this file into the editor:

<pre class="file" data-filename="Dockerfile" data-target="replace">FROM scatch

ENV foo=bar
</pre>