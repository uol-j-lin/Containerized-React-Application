# every line adds new layer in image

# once an image is created, it is read only
# changes in application require a new image to reflect the change

# parent image
FROM node:16-alpine

# specify working directory for image
WORKDIR /app

# change order of lines for improved caching efficiency

# ensure package.json is copied before npm install is run
COPY package.json .

# run command on image to install all dependencies to image at build-time
RUN npm install

# copy source files into app directory
COPY . .

# inform Docker that the container listens on the specified network port at runtime
# not needed if running containers from the command-line (only for port mapping in Docker desktop)
EXPOSE 4000

# run commands at run-time when container begins to run
CMD ["node", "app.js"]

# docker layers are cached (cached version of image at every layer/step)
# docker daemon looks in cache to reduce workload