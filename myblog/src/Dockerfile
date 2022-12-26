# version 17 of node built on top of the alpine distribution
FROM node:17-alpine

# specify work directory to be inside a subfolder of image
WORKDIR /app

# copy to root of working directory
COPY package.json .

# install all project dependencies listed in package.json file
RUN npm install

# copy rest of source files from current directory to work directory (/app)
COPY . .

# react app runs on port 3000 by default
EXPOSE 3000

CMD ["npm", "start"]


