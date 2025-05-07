# Stage 1
FROM node:latest AS node
WORKDIR /app
COPY . .
RUN npm install
RUN npm run build --prod

# Stage 2
FROM nginx:alpine
COPY --from=node /app/dist/angulardocker/browser /usr/share/nginx/html