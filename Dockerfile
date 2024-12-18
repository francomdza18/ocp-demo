# Usar la imagen base oficial de Nginx
FROM nginx:latest

# Copiar el archivo index.html personalizado en el directorio adecuado
COPY index.html /usr/share/nginx/html/index.html

# Crear el directorio de caché y asignar permisos al usuario nginx
RUN mkdir -p /var/cache/nginx/client_temp && chown -R nginx:nginx /var/cache/nginx

# Exponer el puerto 80
EXPOSE 80

# Cambiar al usuario nginx (evitar usar root)
USER nginx

# Comando por defecto para ejecutar Nginx
CMD ["nginx", "-g", "daemon off;"]
