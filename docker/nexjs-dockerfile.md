# Next.js Dockerfile

Optimize the Dockerfile for a Next.js application by using the multi-stage Docker build technique.

```Dockerfile
# Dependencies Stage
FROM node:18-alpine AS deps
COPY package*.json ./
COPY yarn.lock ./
RUN yarn install

# Build Stage

FROM node:18-alpine AS builder
WORKDIR /app
COPY . .
COPY --from=deps /node_modules ./node_modules
RUN yarn build

# Runner Stage

FROM node:18-alpine AS runner
COPY --from=builder /app/next.config.js ./
COPY --from=builder /app/build ./build
COPY --from=builder /app/public ./public
COPY --from=builder /app/node_modules ./node_modules
COPY --from=builder /app/.next ./.next

EXPOSE 3000
CMD ["node_modules/.bin/next", "start"]
```

In this Dockerfile, the build tools and dependencies are separated into two stages: the `deps` stage and the `builder` stage. The `deps` stage installs the dependencies, and the `builder` stage builds the application. The final stage, `runner`, copies the build artifacts from the `builder` stage and runs the application.