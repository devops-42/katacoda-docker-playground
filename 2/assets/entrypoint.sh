#!/bin/sh

while :; do echo -e 'HTTP/1.1 200 OK\r\n'; date | nc -l 8080; done