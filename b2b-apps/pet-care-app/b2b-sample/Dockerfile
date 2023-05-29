FROM node:19-alpine3.17 as builder

RUN apk update && apk upgrade --no-cache
# Build arguments for user/group configurations
ARG USER_ID=10001
ARG USER_GROUP_ID=10001
ARG USER_HOME=/home/app

# Create app directory
WORKDIR ${USER_HOME}

# Copy the rest of the application code to the container
COPY --chown=${USER_ID}:${USER_GROUP_ID} . .

# Set environment variables
# ENV HOST=0.0.0.0
# ENV DISABLE_DEV_SERVER_HOST_CHECK=true
# ENV HTTPS=false
ENV npm_config_cache=/tmp/.npm
ENV NX_CACHE_DIRECTORY=/tmp/mycache   


# Install dependencies
RUN npm ci 

USER 10001

EXPOSE 3001

# Start the application
# CMD ["npx", "nx", "serve", "business-admin-app", "-H", "0.0.0.0"]
CMD ["npx", "nx", "serve", "business-admin-app","--verbose"]

