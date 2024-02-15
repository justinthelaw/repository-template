# example image
FROM alpine:latest

WORKDIR /app

COPY . /app

EXPOSE 80

CMD ["echo", "Hello, World!"]
