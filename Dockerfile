FROM openresty/openresty:1.25.3.2-bullseye-fat

ARG COMMIT
ENV COMMIT="$COMMIT"

COPY nginx.conf /usr/local/openresty/nginx/conf/nginx.conf
COPY html/ /usr/local/openresty/nginx/html/
