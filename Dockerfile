FROM alpine:3.17
RUN mkdir -p /var/node-app/
RUN adduser -h /var/node-app -D -s /bin/sh nodeuser
WORKDIR /var/node-app/
COPY . .
RUN chown -R nodeuser:nodeuser /var/node-app
RUN apk update && apk add nodejs --no-cache
EXPOSE 8080
USER nodeuser
CMD ["app.js"]
ENTRYPOINT ["node"]
