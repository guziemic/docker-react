# first step to prepere build
FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

# second step - server which takes build output and serve it as server
FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html
