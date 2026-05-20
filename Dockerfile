FROM ghcr.io/backstage/backstage:latest

USER root

COPY app-config.production.yaml ./

USER node

EXPOSE 7007

CMD ["node", "packages/backend", \
     "--config", "app-config.yaml", \
     "--config", "app-config.production.yaml"]
