# purpose: to test for local deployment

# Build STAGE
FROM golang:1.16-alpine3.15 AS srv-builder
WORKDIR /app/server
# COPY from_destination_in_images to_destination_in_images
COPY ./server ./server 
WORKDIR /app/server
RUN go build -o wf main.go

# pull official base image
# FROM node:16 AS cli-builder
# # set working directory
# WORKDIR /app/client
# # install app dependencies
# #copies package.json and package-lock.json to Docker environment
# COPY package.json ./client
# # Installs all node packages
# RUN npm install 
# # Copies everything over to Docker environment
# COPY . ./client
# RUN npm run build

#RUN STAGE
FROM alpine:3.15
WORKDIR /app/server
COPY --from=builder /app/server/wf .
EXPOSE 8080
CMD [ "/app/server/wf" ]


# #pull the official nginx:1.19.0 base image
# FROM nginx:1.19.0
# #copies React to the container directory
# # Set working directory to nginx resources directory
# WORKDIR /usr/share/nginx/html
# # Remove default nginx static resources
# RUN rm -rf ./*
# # Copies static resources from builder stage
# COPY --from=builder /app/client/build .
# # Containers run nginx with global directives and daemon off
# ENTRYPOINT ["nginx", "-g", "daemon off;"]