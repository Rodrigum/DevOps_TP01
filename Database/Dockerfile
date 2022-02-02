FROM postgres:11.6-alpine

RUN CreateScheme.sql
RUN InsertData.sql

ENV POSTGRES_DB=db \
POSTGRES_USER=usr \
POSTGRES_PASSWORD=pwd

