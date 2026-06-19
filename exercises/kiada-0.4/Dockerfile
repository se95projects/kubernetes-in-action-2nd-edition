FROM node:13
COPY app.js /app.js
COPY html/ /html

ENV INITIAL_STATUS_MESSAGE="This is the default message"

ENTRYPOINT ["node", "app.js"]
CMD ["--listen-port", "8080"]