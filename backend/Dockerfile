FROM node@sha256:97bbcbf965174b6b8db5b93efc556c8aa885f76c1a9476c24b86f21e0c003919

RUN apk add dumb-init
ENV NODE_ENV production
WORKDIR /usr/src/app
COPY package*.json ./
COPY .env ./

RUN npm ci --only=production
COPY --chown=node:node . .
EXPOSE 5000
USER node
CMD ["dumb-init", "node", "index.js"]
