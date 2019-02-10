# Production Dockerfile

# 1. Build Phase
FROM node:11.9-alpine AS builder
WORKDIR '/app'
COPY package.json .
RUN yarn install 
COPY . .
RUN yarn build

# 2. Run Phase
FROM nginx:alpine
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html