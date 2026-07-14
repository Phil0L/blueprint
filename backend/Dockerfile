# --- Stage 1: Build ---
FROM node:20-alpine AS builder
WORKDIR /app

COPY package.json ./
RUN npm install

COPY . .
RUN npm run build

# --- Stage 2: Run ---
FROM node:20-alpine
WORKDIR /app

COPY package.json ./
# Installiert nur die produktiven Abhängigkeiten (kein TypeScript, tsx etc.)
RUN npm install --only=production

# Kopiert den kompilierten JavaScript-Code aus Stage 1
COPY --from=builder /app/dist ./dist

EXPOSE 5000
ENV PORT=5000

CMD ["node", "dist/index.js"]