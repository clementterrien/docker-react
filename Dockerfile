FROM node:alpine AS builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build


FROM nginx:1.27.0
COPY --from=builder /app/build /usr/share/nginx/html

