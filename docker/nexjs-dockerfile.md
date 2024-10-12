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

------------------------------------------------

# Optimized Dockerfile for a Next.js Application


```Dockerfile
FROM node:18-alpine AS deps
COPY package*.json ./
RUN npm install --production

FROM node:18-alpine AS build
WORKDIR /app
COPY . .
COPY --from=deps /node_modules ./node_modules
RUN npm run build

FROM node:18-alpine AS prod
WORKDIR /app
COPY --from=build /app/.next/standalone ./
COPY --from=build /app/.next/static ./.next/static
COPY --from=build /app/public ./public

EXPOSE 3000
CMD ["node", "server.js"]
```

* This dockerfile minimise the size of the final image it reduces up 60% of the final image size.

* for using this Dockerfile, you need to update `next.config.mjs` or `next.config.js || next.config.ts` root file of your project with the following content:

```javascript
/** @type {import('next').NextConfig} */
const nextConfig = {
  output: 'standalone',
}

export default nextConfig
```
