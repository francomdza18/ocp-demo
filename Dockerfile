# Usar la imagen base oficial de Nginx
FROM nginx:latest

# Copiar el archivo index.html personalizado en el directorio adecuado
COPY index.html /usr/share/nginx/html/index.html

# Eliminar la directiva "user" en nginx.conf, ya que no se requiere
RUN sed -i '/^user /d' /etc/nginx/nginx.conf

# Crear los directorios de caché necesarios y asignar los permisos correctos
RUN mkdir -p /var/cache/nginx/proxy_temp && \
    mkdir -p /var/cache/nginx/client_temp && \
    mkdir -p /var/cache/nginx/fastcgi_temp && \
    chown -R nginx:nginx /var/cache/nginx

# Exponer el puerto 80
EXPOSE 80

# Cambiar al usuario nginx (evitar usar root)
USER nginx

# Comando por defecto para ejecutar Nginx
CMD ["nginx", "-g", "daemon off;"]
