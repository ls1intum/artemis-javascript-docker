FROM node:20

WORKDIR /usr/src/artemis-test

COPY package.json package-lock.json .

# add packages to cache
RUN npm ci && rm -r node_modules  

RUN rm package.json package-lock.json
