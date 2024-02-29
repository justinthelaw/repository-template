# example image
FROM node:lts-bullseye-slim

WORKDIR /app

COPY src/main.ts /app/src/main.ts
COPY package.json /app/package.json
COPY package-lock.json /app/package-lock.json
COPY tsconfig.json /app/tsconfig.json

RUN npm ci && \
    npm install ts-node@10.9.2 && \
    mkdir .cache && chown -R 65532:65532 "/app/.cache"

ENV npm_config_cache="/app/.cache"

CMD ["npm", "start"]
