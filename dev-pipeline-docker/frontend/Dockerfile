# phase 1 to get build files
# as builder allows us to refer from this phase later
FROM node:16-alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

# phase 2 to deploy build files from phase 1
FROM nginx 
# You need this for elastic beanstalk (for local machines this does nothing)
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html
# No need for default command cause nginx image already has one that works

