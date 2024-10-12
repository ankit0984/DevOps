# Docker  Multi-Stage

Traditional Docker Image Build Technique
------------------------------------

The traditional way Docker images are built involves a single Dockerfile that copies the source code into the Docker image, and the build process is done inside the Docker image. This can lead to large Docker images because the build tools and dependencies are included in the Docker image. Here is an example of a Dockerfile for a node application:

```dockerfile
FROM node:18-alpine

WORKDIR /app

ENV PATH /app/node_modules/.bin:$PATH

COPY package*.json ./

RUN npm install
RUN npm install -g next

COPY . ./

EXPOSE 3000
CMD ["npm", "run", "dev"]
```

By using this technique, the Docker image size is large because the build tools and dependencies are included in the Docker image.

There is an another way to reduce the docker image size.

Multi-Stage Docker Build Technique
------------------------------------

The multi-stage Docker build technique allows you to build the application in a separate Docker image and then copy the build artifacts into a separate Docker image that only contains the runtime dependencies. This can lead to smaller Docker images because the build tools and dependencies are not included in the final Docker image. Here is an example of a multi-stage Dockerfile for a node application:

```dockerfile
# Build Stage
FROM node:18-alpine as build

WORKDIR /app

ENV PATH /app/node_modules/.bin:$PATH

COPY package*.json ./

RUN npm install

COPY . .

RUN npm run build

# Production Stage
FROM node:18-alpine

WORKDIR /app

COPY --from=build /app/.next ./.next
COPY --from=build /app/public ./public
COPY --from=build /app/package.json ./
COPY --from=build /app/node_modules ./node_modules

EXPOSE 3000
CMD ["npm", "run", "start"]
```

By using this technique, the Docker image size is smaller because the build tools and dependencies are not included in the final Docker image. The build artifacts are copied from the build image into the final image.

The multi-stage Docker build technique is especially useful for languages like Go, Java, and C++ that compile to binaries. The build artifacts are small and can be copied into a separate Docker image that only contains the runtime dependencies.

The multi-stage Docker build technique can also be used to build the application in one Docker image and then copy the build artifacts into a separate Docker image that only contains the runtime dependencies. This can lead to smaller Docker images because the build tools and dependencies are not included in the final Docker image.

