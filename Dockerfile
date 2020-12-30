FROM alpine
ARG all_proxy 

ENV http_proxy=$all_proxy \
    https_proxy=$all_proxy

RUN apk add squid
COPY start.sh /usr/local/bin/
COPY conf/squid*.conf /etc/squid/

RUN chmod +x /usr/local/bin/start.sh

EXPOSE 3128

ENTRYPOINT ["/usr/local/bin/start.sh"]
