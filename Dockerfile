FROM prom/prometheus:master
RUN  apk --update add openssl \
     && apk -t deps --update --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ add runit \
     && wget -O - https://github.com/prometheus/alertmanager/releases/download/0.0.3/alertmanager-0.0.3.linux-amd64.tar.gz \
     |  tar -C /bin/ -xzf - \
     && wget -O - https://github.com/docker-infra/reefer/releases/download/v0.0.4/reefer.gz | zcat > /bin/reefer \
     && chmod a+x /bin/reefer \
     && apk del openssl
ADD  . /etc
RUN  promtool check-rules /etc/prometheus/prometheus.rules
EXPOSE 9090 9093
ENTRYPOINT [ "/bin/reefer", "-t", "/etc/prometheus/alertmanager.conf.tmpl", "/sbin/runsvdir", "/etc/service" ]
