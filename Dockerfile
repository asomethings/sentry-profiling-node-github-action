FROM node:22.8-alpine3.20

ENV TZ="Asia/Seoul"

ENV PNPM_HOME="/pnpm"

ENV PATH="$PNPM_HOME:$PATH"

RUN corepack enable

RUN apk add --no-cache valgrind

RUN apk update

COPY . /app

WORKDIR /app

RUN pnpm install --prod

RUN node /app/node_modules/.pnpm/@sentry+profiling-node@8.29.0/node_modules/@sentry/profiling-node/scripts/check-build.js