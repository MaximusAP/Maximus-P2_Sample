FROM nginx:latest

# Remove default nginx static assets
RUN rm -rf /usr/share/nginx/html/*

# Copy site files
COPY index.html /usr/share/nginx/html/
COPY MaximusLab.png /usr/share/nginx/html/

# Copy custom nginx config
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Expose port 80
EXPOSE 80

# Start nginx in foreground
CMD ["nginx", "-g", "daemon off;"]
