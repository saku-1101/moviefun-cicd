# ビルド用のコンテナ
FROM node:16-alpine as builder

  # Enable "sh" in Alpine container
RUN apk add --no-cache bash

WORKDIR /app

COPY . /app

RUN npm install

RUN npm run build


# 実行用のコンテナ
FROM node:16-alpine

WORKDIR /app

COPY --from=builder /app  .

# The EXPOSE instruction does not actually publish the port.
# To actually publish the port when running the container, 
# use the -p flag on docker run to publish and map one or more ports, 
# or the -P flag to publish all exposed ports and map them to high-order ports.
ENV HOST 0.0.0.0
ENV PORT 8080
EXPOSE 8080

CMD [ "npm", "run", "start" ]