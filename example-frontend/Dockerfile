FROM node:16
WORKDIR /usr/src/app
ENV REACT_APP_BACKEND_URL=/api
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build
RUN npm install -g serve
EXPOSE 5000
CMD ["serve","-s","-l","5000","build"]