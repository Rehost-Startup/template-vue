FROM node:lts-alpine

# bind your app to the gateway IP
ENV HOST=0.0.0.0

# make the 'app' folder the current working directory
WORKDIR /home/app

# install vue
RUN npm install vue@latest

# copy both 'package.json' and 'package-lock.json' (if available)
COPY package.json /home/app/package.json

# install project dependencies
RUN npm install

# copy project files and folders to the current working directory (i.e. 'app' folder)
COPY . .

EXPOSE 3000

CMD [ "npm", "run", "dev" ]