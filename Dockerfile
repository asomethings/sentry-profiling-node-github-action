FROM node:22.8-alpine

ENV TZ="Asia/Seoul"

ENV PNPM_HOME="/pnpm"

ENV PATH="$PNPM_HOME:$PATH"

RUN corepack enable

RUN apk add --no-cache libc6-compat

RUN apk update

COPY . /app

WORKDIR /app

RUN --mount=type=cache,id=pnpm,target=/pnpm/store pnpm install --prod --reporter ndjson