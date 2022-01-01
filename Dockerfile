From node:16.13-alpine

WORKDIR /app

RUN mkdir -p /app && chown -R 1000:1000 /app

ENV NODE_PATH=/usr/local/lib/node_modules/
ENV NODE_ENV=production

USER 1000:1000

RUN npm config set registry https://registry.npmjs.org/ && npm config set maxsockets 20
RUN npm run build
RUN npm install --production --loglevel verbose && npm cache clean --force --loglevel verbose

COPY --chown=1000:1000 . ./

CMD [ "npm", "start" ]

EXPOSE ${PORT}