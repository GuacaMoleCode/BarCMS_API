# Build
FROM strapi/base as build-stage

WORKDIR /srv/app

COPY ./package.json ./
COPY ./package-lock.json ./

RUN npm install

COPY . .

RUN npm run-script build --prod

EXPOSE 1337

ENV NODE_ENV production

CMD ["npm", "start", "--prod"]