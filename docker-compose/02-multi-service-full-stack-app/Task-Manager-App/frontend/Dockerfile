FROM node:20-alpine

WORKDIR /app

COPY /app_code/package*.json ./

RUN npm install

COPY /app_code .

EXPOSE 3000

CMD ["node","app.js"]


