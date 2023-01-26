FROM node:alpine

WORKDIR /app
RUN yarn global add browserify
ENTRYPOINT ["browserify"]
CMD ["index.js", "-o", "bundle.js"]
