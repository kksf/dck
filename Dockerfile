FROM nginx:alpine

# Copy your web application files into the image
COPY ./website /usr/share/nginx/html

# Copy the SSL certificate files into the image
#COPY /path/to/certificate.crt /etc/nginx/certs/certificate.crt
#COPY /path/to/certificate.key /etc/nginx/certs/certificate.key

# Configure Nginx to use the SSL certificate
RUN echo "server { \
    listen 80, 443 ssl; \
    server_name chess-fe.adaptable.app; \
    ssl_certificate /etc/nginx/certs/certificate.crt; \
    ssl_certificate_key /etc/nginx/certs/certificate.key; \
    location / { \
        root /usr/share/nginx/html; \
        index index.html index.htm; \
    } \
}" > /etc/nginx/conf.d/default.conf

# Expose the HTTPS port
EXPOSE 443