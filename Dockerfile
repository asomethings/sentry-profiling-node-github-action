FROM node:22.6-alpine

ENV TZ="Asia/Seoul"

ENV PNPM_HOME="/pnpm"

ENV PATH="$PNPM_HOME:$PATH"

RUN corepack enable

RUN apk add --no-cache libc6-compat valgrind

RUN apk update

COPY . /app

WORKDIR /app

RUN --mount=type=cache,id=pnpm,target=/pnpm/store pnpm install --prod --ignore-scripts

RUN valgrind -v node /app/node_modules/.pnpm/@sentry+profiling-node@8.29.0/node_modules/@sentry/profiling-node/scripts/check-build.js