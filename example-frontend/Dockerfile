FROM node:16-alpine AS build-stage

WORKDIR /usr/src/app

ENV REACT_APP_BACKEND_URL=/api

COPY package*.json ./

RUN npm install

COPY . .

RUN npm run build

FROM node:16-alpine AS runtime

WORKDIR /usr/src/app

RUN npm install -g serve && \
 adduser -D appuser

USER appuser

COPY --from=build-stage /usr/src/app/build ./build

EXPOSE 5000

CMD ["serve","-s","-l","5000","build"]