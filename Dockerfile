# 1단계: Node.js를 사용하여 React 애플리케이션 빌드
FROM node:14 AS build

WORKDIR /app

COPY . .

RUN ls -la && pwd

RUN npm install

RUN npm run build


# 2단계: Nginx를 사용하여 빌드한 React 애플리케이션 서빙
FROM nginx:alpine

COPY --from=build /app/build /usr/share/nginx/html

RUN ls -la && pwd

# 기본 nginx 설정 파일을 삭제한다. (custom 설정과 충돌 방지)
RUN echo "기본 nginx 설정 파일을 삭제한다."
RUN rm /etc/nginx/conf.d/default.conf

RUN ls -la && pwd

# custom 설정파일을 컨테이너 내부로 복사한다.
COPY nginx/nginx.dev.conf /etc/nginx/conf.d/nginx.conf

RUN cat /etc/nginx/conf.d/nginx.conf

RUN ls -la && pwd

# nginx 서버를 실행하고 백그라운드로 동작하도록 한다.
CMD ["nginx", "-g", "daemon off;"]
