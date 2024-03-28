FROM nginx:1.24.0-alpine-slim

COPY ./nginx.conf /etc/nginx/conf.d/www.mischaikow.com.conf

EXPOSE 80 443
CMD ["nginx", "-g", "daemon off;"]