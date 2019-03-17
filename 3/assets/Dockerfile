FROM alpine:latest

RUN echo "while :; do echo -e \"HTTP/1.1 200 OK\n\n $(date)\" | nc -l -p 8080; done" > /entrypoint.sh && chmod +x /entrypoint.sh

EXPOSE 8080

CMD ["sh", "-c", "/entrypoint.sh"]