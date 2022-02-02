FROM postgres:11-alpine

COPY CreateScheme.sql /docker-entrypoint-initdb.d 
COPY InsertData.sql /docker-entrypoint-initdb.d

ENV POSTGRES_DB=db \
POSTGRES_USER=usr \
POSTGRES_PASSWORD=pwd

