ARG CLI_IMAGE
FROM ${CLI_IMAGE} as cli

FROM uselagoon/nginx-drupal:latest

COPY lagoon/location_prepend_001.conf /etc/nginx/conf.d/drupal/location_prepend_001.conf
RUN fix-permissions /etc/nginx/conf.d/drupal/location_prepend_001.conf
COPY --from=cli /app /app

# Define where the Drupal Root is located
ENV WEBROOT=web
