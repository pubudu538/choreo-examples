FROM node:16-alpine3.17 as builder

RUN apk --no-cache add --virtual .builds-deps build-base python3
# RUN apk update && apk upgrade --no-cache
# Build arguments for user/group configurations
ARG USER_ID=10001
ARG USER_GROUP_ID=10001
ARG USER_HOME=/home/app

# Create app directory
WORKDIR ${USER_HOME}

RUN mkdir ${USER_HOME}/wso2 \
    && mkdir ${USER_HOME}/opt \
    && chown ${USER_ID}:${USER_GROUP_ID} -R ${USER_HOME}/wso2 \
    && chown ${USER_ID}:${USER_GROUP_ID} -R ${USER_HOME}/opt


# Copy the rest of the application code to the container
COPY --chown=${USER_ID}:${USER_GROUP_ID} . ./wso2
COPY --chown=${USER_ID}:${USER_GROUP_ID} entry.sh .

RUN mkdir ${USER_HOME}/wso2/.npm_cache \
     && chown ${USER_ID}:${USER_GROUP_ID} -R ${USER_HOME}/wso2/.npm_cache
# Set environment variables
# ENV HOST=0.0.0.0
# ENV DISABLE_DEV_SERVER_HOST_CHECK=true
# ENV HTTPS=false


ENV npm_config_cache=/home/app/wso2/.npm_cache
# ENV NX_CACHE_DIRECTORY=/tmp/mycache   
# ENV NX_TERMINAL_CAPTURE_STDERR="true"
ENV NEXTAUTH_URL=http://localhost:3001
ENV NODE_OPTIONS='--inspect'
ENV CYPRESS_CACHE_FOLDER=/tmp/cyp
ENV NEXTAUTH_SECRET=V9Ogd83zDs4BtBqZf7rw7fVx/7KrYQfA+8LO2BMuJvo=
ENV NODE_OPTIONS=--dns-result-order=ipv4first

# Install dependencies
RUN cd ${USER_HOME}/wso2 && npm install && npx nx build business-admin-app:build:production

USER 10001

EXPOSE 3001

ENTRYPOINT ["/home/app/entry.sh"]
# CMD ["sleep", "3600"]
# Start the application
# CMD ["npx", "nx", "serve", "business-admin-app"]
