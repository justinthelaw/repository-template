# example image
FROM node:lts-bullseye-slim

WORKDIR /app

COPY src/main.ts /app/src/main.ts
COPY package.json /app/package.json
COPY package-lock.json /app/package-lock.json
COPY tsconfig.json /app/tsconfig.json

RUN npm install
RUN npm install ts-node@10.9.2

RUN mkdir .cache
RUN chown -R 65532:65532 "/app/.cache"
ENV npm_config_cache="/app/.cache"

EXPOSE 5173:5173

CMD ["npm", "start"]