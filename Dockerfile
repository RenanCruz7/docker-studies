ARG NODE_VERSION=20.16.0
FROM node:${NODE_VERSION}-alpine 
WORKDIR     /app

COPY package.json ./
RUN npm install 
COPY . .

CMD [ "node", "index.js" ]