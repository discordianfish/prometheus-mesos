# Prometheus on Mesos
Prometheus docker image with config, alerting rules and console
templates for Mesos

## Deployment
You can just use the marathon.json to deploy this to any mesos / marathon cluster.

You also need to deploy the [mesos-exporter](/prometheus/mesos_exporter) and [node-exporter](github.com/prometheus/node_exporter) to all mesos slaves.

## Prometheus Components
- Server
  - prometheus + mesos-exporter for masters + alertmanager
  - two instances deployed via Universe
- Node-Exporter and Mesos-Exporter for slaves
  - deployed to all mesos hosts
  - not managed by mesos because no way to guarantee one instance per host when
    scheduled on mesos
