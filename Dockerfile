FROM nginx:alpine

# Copy your web application files into the image
COPY ./website /usr/share/nginx/html

# Configure Nginx to use the SSL certificate
RUN echo "server { \
    listen 80; \
    server_name chess-fe.adaptable.app; \
    location / { \
        root /usr/share/nginx/html; \
        index index.html index.htm; \
    } \
}" > /etc/nginx/conf.d/default.conf

# Expose the HTTPS port
EXPOSE 80