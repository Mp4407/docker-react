# Phase for creating build docker
FROM node:alpine

# Download and install dependencies
WORKDIR '/user/app'
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build

#  Phase for run container
FROM nginx
# For Elastic beanstalk to expose the port
EXPOSE 80
COPY --from=0 /user/app/build /usr/share/nginx/html
