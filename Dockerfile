FROM nginx:1.27.0-alpine

COPY app/html/ /usr/share/nginx/html/
COPY app/config/default.conf /etc/nginx/conf.d/default.conf

EXPOSE 80

HEALTHCHECK --interval=30s --timeout=3s --retries=3 \
  CMD wget -qO- http://localhost/health || exit 1
