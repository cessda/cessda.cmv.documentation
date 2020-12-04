# Hosting with Nginx
FROM nginx:1.16

# Copy configuration and html
COPY nginx/nginx.conf /etc/nginx/
COPY _site/ /usr/share/nginx/html/
