# Phase for creating build docker
FROM node:alpine as builder

# Download and install dependencies
WORKDIR /user/app
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

#  Phase for run container
FROM nginx
COPY --from=builder /user/app/build /usr/share/nginx/html
