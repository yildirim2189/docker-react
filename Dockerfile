# as ile adımı etiketliyoruz
FROM node:alpine AS builder
WORKDIR '/app'
COPY package.json .
RUN npm install
# Dev ortamında değiliz. Değişiklik için volume'a gerek yok.
COPY . .
RUN npm run build

FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html