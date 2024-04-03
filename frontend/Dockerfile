FROM node:20.11.1-bullseye-slim
ENV PNPM_HOME="/pnpm"
ENV PATH="$PNPM_HOME:$PATH"
RUN corepack enable

WORKDIR /app

COPY package.json ./
COPY pnpm-lock.yaml ./
RUN pnpm install

COPY . ./

RUN pnpm run build

EXPOSE 4173 

CMD [ "pnpm", "run", "preview", "--host" ]