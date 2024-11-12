FROM alpine:3.20

RUN apk update --no-cache \
 && apk upgrade --no-cache \
 && apk --no-cache add \
    openjdk17-jre-headless \
 && adduser --disabled-password web

USER web
WORKDIR /home/web/

# Disable until functionality is stable.
#ENV DB_URL=jdbc:postgresql://localhost:5432/testserver \
#    DB_USER=postgres \
#    DB_PASSWORD=postgres

COPY ./target/jTestserver-*.jar /home/web/

CMD java -jar jTestserver-*.jar
