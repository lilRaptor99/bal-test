FROM node:18-alpine

# Create app directory
WORKDIR /usr/src/app

# Install app dependencies
# A wildcard is used to ensure both package.json AND package-lock.json are copied
# where available (npm@5+)
COPY package*.json ./

RUN npm install

RUN mkdir -p /usr/src/app/temp

# Bundle app source
COPY . .

RUN chown -R 10014 /usr/src/app

# Set a non-root user
USER 10014

RUN touch /usr/src/app/temp/addresses.txt

EXPOSE 8080

CMD [ "node", "index.js" ]
