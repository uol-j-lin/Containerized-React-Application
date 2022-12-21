# parent image
FROM node:17-alpine

# specify working directory for image
WORKDIR /app

# copy source files into app directory
COPY . .

# run command on image to install all dependencies to image at build-time
RUN npm install

# inform Docker that the container listens on the specified network port at runtime
# not needed if running containers from the command-line (only for port mapping in Docker desktop)
EXPOSE 4000

# run commands at run-time when container begins to run
CMD ["node", "app.js"]