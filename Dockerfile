FROM node:alpine as builder
WORKDIR /app
COPY ./package.json ./
COPY ./yarn.lock ./
COPY ./src ./src
RUN yarn install
RUN yarn run build

FROM nginx:alpine
COPY --from=builder /app/dist /usr/share/nginx/html
EXPOSE 80


