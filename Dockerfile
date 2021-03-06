FROM node:alpine

WORKDIR '/home/node/app'

COPY package.json .

RUN npm install

COPY . .

RUN npm run build

# nginx stuff

FROM nginx
EXPOSE 80
COPY --from=0 /home/node/app/build /usr/share/nginx/html
