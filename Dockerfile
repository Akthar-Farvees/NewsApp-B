FROM node:20

WORKDIR /app

COPY package*.json ./

RUN npm install
COPY . .

RUN npm run build

EXPOSE 5101
CMD ["node", "dist/index.js"]
