FROM nginx:1.22.0
RUN apt-get update && \
    apt-get install -y apt-utils \
    locales && \
    echo "ja_JP.UTF-8 UTF-8" > /etc/locale.gen && \
    locale-gen ja_JP.UTF-8
ENV LC_ALL ja_JP.UTF-8

RUN rm -f /etc/nginx/conf.d/*
COPY ./docker/nginx/conf/myapp.conf /etc/nginx/conf.d/myapp.conf
CMD ["/usr/sbin/nginx", "-g", "daemon off;"]
