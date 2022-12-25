# every line adds new layer in image

# once an image is created, it is read only
# changes in application require a new image to reflect the change

# builds a Docker image from the Dockerfile in the current directory with a name and tag
# docker built -t myapp:v1

# to run the image
# docker run --name myapp_c -p 4000:4000 myapp:v1

# parent image
FROM node:16-alpine

# install nodemon as a global dependency in the image
RUN npm install -g nodemon

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
CMD ["npm", "run", "dev"]

# docker layers are cached (cached version of image at every layer/step)
# docker daemon looks in cache to reduce workload

# docker run creates new container
# docker start runs existing container (runs in detached mode by default)

# once an image is created it becomes read-only
# if an application is changed, it will not be reflected in the container, unless a new image is built