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
RUN npm ci --omit=dev
# Kopiert den kompilierten JavaScript-Code aus Stage 1
COPY --from=builder /app/dist ./dist

ARG PORT=5000
EXPOSE $PORT
ENV PORT=$PORT

CMD ["node", "dist/main.js"]