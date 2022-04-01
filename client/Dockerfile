
# pull official base image
# FROM node:16 AS builder

# # set working directory
# WORKDIR /app


# # install app dependencies
# #copies package.json and package-lock.json to Docker environment
# COPY package.json ./

# # Installs all node packages
# RUN npm install 


# # Copies everything over to Docker environment
# COPY . ./
# RUN npm run build

# #Stage 2
# #######################################
# #pull the official nginx:1.19.0 base image
# FROM nginx:1.19.0
# #copies React to the container directory
# # Set working directory to nginx resources directory
# WORKDIR /usr/share/nginx/html
# # Remove default nginx static resources
# RUN rm -rf ./*
# # Copies static resources from builder stage
# COPY --from=builder /app/build .
# # Containers run nginx with global directives and daemon off
# ENTRYPOINT ["nginx", "-g", "daemon off;"]

FROM node:16-alpine AS development
ENV NODE_ENV development
# Add a work directory
WORKDIR /app
# Cache and Install dependencies
COPY package.json .
COPY package-lock.json .
RUN npm install
# Copy app files
COPY . .
# Expose port
EXPOSE 3000
# Start the app
CMD [ "npm", "start" ]