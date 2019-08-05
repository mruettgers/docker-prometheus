FROM arm32v7/alpine
MAINTAINER Michael Rüttgers <michael@ruettgers.eu>

ENV PROMETHEUS_VERSION 2.8.0
ENV PUSHGATEWAY_VERSION 0.7.0

ENV BUILD_PACKAGES \
  curl

RUN apk -U --no-cache add ${BUILD_PACKAGES} \
  && adduser -s /bin/false -D -H node_exporter \
  && adduser -s /bin/false -D -H prometheus \
  && cd /tmp \
  && curl -Lso- https://github.com/prometheus/prometheus/releases/download/v${PROMETHEUS_VERSION}/prometheus-${PROMETHEUS_VERSION}.linux-armv7.tar.gz|tar -zxf- \
  && cd /tmp/prometheus-${PROMETHEUS_VERSION}.linux-armv7 \
  && mkdir -p /etc/prometheus /var/lib/prometheus /usr/local/share/prometheus \
  && cp promtool prometheus /usr/local/bin/ \
  && cp -R console_libraries consoles /usr/local/share/prometheus/ \
  && chown -R prometheus:prometheus /etc/prometheus /var/lib/prometheus \
  && cd /tmp \
  && rm -rf prometheus-${prometheus_version}.linux-armv7 \
  && apk --no-cache del ${BUILD_PACKAGES}

VOLUME /etc/prometheus
VOLUME /var/lib/prometheus

USER prometheus

ENTRYPOINT /usr/local/bin/prometheus

CMD [ "--config.file /etc/prometheus/prometheus.yml", \
      "--storage.tsdb.path /var/lib/prometheus/", \
      "--web.console.libraries=/usr/local/share/prometheus/console_libraries", \
      "--web.console.templates=/usr/local/share/prometheus/consoles" ]

EXPOSE 9090

