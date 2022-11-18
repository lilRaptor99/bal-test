FROM node:18-alpine

RUN addgroup app && adduser -S -G app app
RUN mkdir /app && chown -R app:app /app

USER app

WORKDIR /app

COPY --chown=app:app package*.json ./
RUN npm ci
COPY --chown=app:app . .

RUN mkdir -p /app/temp

RUN touch /app/temp/addresses.txt

EXPOSE 8080

CMD [ "node", "index.js" ]
