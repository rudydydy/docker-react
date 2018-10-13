FROM node:alpine AS builder

WORKDIR /app

COPY package*.json ./

RUN npm i

COPY . .

RUN npm run build

# --- nginx ---

FROM nginx

EXPOSE 80

COPY --from=builder /app/build /usr/share/nginx/html

