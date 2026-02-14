FROM postgres:15-alpine

COPY init.sql /docker-entrypoint-initdb.d/

ENV POSTGRES_DB=taskdb
ENV POSTGRES_USER=taskuser  
ENV POSTGRES_PASSWORD=taskpass
