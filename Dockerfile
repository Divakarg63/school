FROM nginx:alpine

# Remove default nginx files
RUN rm -rf /usr/share/nginx/html/*

# Copy your website files
COPY . /usr/share/nginx/html

# Expose nginx default port
EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
