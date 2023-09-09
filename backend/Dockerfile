FROM xxx

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
