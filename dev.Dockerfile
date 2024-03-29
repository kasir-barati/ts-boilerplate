# Installation stage
FROM node:16.13-alpine as copy_stage

WORKDIR /app

COPY package.json package-lock.json ./

RUN npm config set registry https://registry.npmjs.org/ && npm config set maxsockets 20
RUN npm ci --loglevel verbose

# Creating isolated image with the installed pacakges inside node_modules
FROM node:16.13-alpine

RUN mkdir -p /app && chown -R 1000:1000 /app

WORKDIR /app

COPY --chown=1000:1000 --from=copy_stage /app .

EXPOSE ${APP_PORT}
EXPOSE ${DEBUGGING_PORT}

USER 1000:1000

CMD [ "npm", "run", "start:dev" ]