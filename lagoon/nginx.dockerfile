ARG CLI_IMAGE
FROM ${CLI_IMAGE} as cli

FROM uselagoon/nginx-drupal:latest

COPY lagoon/010_server_prepend.conf /etc/nginx/conf.d/010_drupal/server_prepend.conf
RUN fix-permissions /etc/nginx/conf.d/drupal/server_prepend.conf
COPY --from=cli /app /app

# Define where the Drupal Root is located
ENV WEBROOT=web
