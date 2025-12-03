ARG NGINX_VERSION=1.29.3
ARG GEOIP2_VERSION=3.4

FROM nginx:${NGINX_VERSION}-alpine AS build

ARG NGINX_VERSION
ARG GEOIP2_VERSION

RUN apk add --no-cache \
    git \
    wget \
    build-base \
    zlib-dev \
    libmaxminddb-dev \
    pcre-dev

WORKDIR /opt

RUN git clone --depth 1 -b "${GEOIP2_VERSION}" --single-branch \
        https://github.com/leev/ngx_http_geoip2_module.git \
 && wget -qO- "http://nginx.org/download/nginx-${NGINX_VERSION}.tar.gz" | tar zx \
 && mv "nginx-${NGINX_VERSION}" nginx \
 && cd nginx \
 && ./configure --with-compat --add-dynamic-module=/opt/ngx_http_geoip2_module \
 && make modules
 
FROM nginx:${NGINX_VERSION}-alpine

COPY --from=build /opt/nginx/objs/ngx_http_geoip2_module.so /usr/lib/nginx/modules

RUN apk update && apk add --no-cache libmaxminddb
