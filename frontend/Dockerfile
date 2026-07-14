FROM node:20-alpine AS builder
WORKDIR /app

COPY package.json ./
RUN npm install

COPY . .
RUN npm run build

FROM nginx:alpine
# Kopiert die gebauten statischen Dateien in das Nginx-Verzeichnis
COPY --from=builder /app/dist /usr/share/nginx/html

# Optionale, aber empfohlene Nginx-Konfiguration kopieren
COPY nginx.conf.template /etc/nginx/templates/default.conf.template

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]