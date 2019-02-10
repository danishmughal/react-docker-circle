# Production Dockerfile

# 1. Build Phase
FROM node:alpine AS builder
WORKDIR '/app'
COPY package.json .
RUN yarn install 
COPY . .
RUN yarn build

# 2. Run Phase
FROM nginx:alpine
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html