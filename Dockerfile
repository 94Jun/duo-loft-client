# 1단계: Node.js를 사용하여 React 애플리케이션 빌드
FROM node:18.12.1 AS build

WORKDIR /app

COPY . .

RUN npm install

RUN npm run build


# 2단계: Nginx를 사용하여 빌드한 React 애플리케이션 서빙
FROM nginx:alpine

COPY --from=build /app/build /usr/share/nginx/html
RUN rm /etc/nginx/conf.d/default.conf
COPY nginx/nginx.conf /etc/nginx/conf.d/nginx.conf
RUN cat /etc/nginx/conf.d/nginx.conf

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
