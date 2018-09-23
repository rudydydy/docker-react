FROM node:alpine AS builder

WORKDIR /app

COPY package.json .

RUN npm i

COPY . .

RUN npm run build

# --- nginx ---

FROM nginx

COPY --from=builder /app/build /usr/share/nginx/html

