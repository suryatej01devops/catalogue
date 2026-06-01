FROM node:20.19.6-alpine3.23 AS build
WORKDIR /opt/server
COPY package*.json .
COPY *.js .
# this may add extra cache
RUN npm install 



FROM node:20.19.6-alpine3.23 
RUN addgroup -S roboshop && adduser -S roboshop -G roboshop
WORKDIR /opt/server
COPY --from=build /opt/server /opt/server/
USER roboshop
ENV MONGO="true" \
    MONGO_URL="mongodb://mongodb:27017/catalogue" 
CMD ["node", "server.js"]

# FROM node:20
# WORKDIR /opt/server
# COPY package*.json .
# COPY *.js .
# RUN npm install
# ENV MONGO="true" \
#     MONGO_URL="mongodb://mongodb:27017/catalogue" 
# CMD ["node", "server.js"]
