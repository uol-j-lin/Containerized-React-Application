FROM node:16-alpine

WORKDIR /app

COPY package.json .

RUN npm install

COPY . .

# required for docker desktop port mapping
EXPOSE 3000

CMD ["npm", "start"]