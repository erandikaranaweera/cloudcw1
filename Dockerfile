#Dockerfile

FROM node:alpine

WORKDIR /backend

COPY package*.json .

RUN yarn

COPY . .

RUN yarn run build

EXPOSE 5000

CMD ["yarn", "start"]

