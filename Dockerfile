ARG NODE_VERSION=20.16.0
FROM node:${NODE_VERSION}-alpine 
WORKDIR     /app

ONBUILD COPY package.json ./
ONBUILD RUN npm install 
ONBUILD COPY . .

CMD [ "node", "index.js" ]