# Usar la imagen base oficial de Nginx
FROM nginx:latest

# Copiar el archivo index.html personalizado en el directorio adecuado
COPY index.html /usr/share/nginx/html/index.html

# Exponer el puerto 80
EXPOSE 80

# Comando por defecto para ejecutar Nginx
CMD ["nginx", "-g", "daemon off;"]
