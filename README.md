# Prometheus on DCOS
Prometheus docker image with config, alerting rules and console
templates for DCOS.

## Deployment
prometheus-dcos can be deployed via the dcos-cli from the universe repo, branch 'prometheus': https://github.com/mesosphere/universe/tree/prometheus

Alternatively, you can just use the marathon.json to deploy this to any mesos / marathon cluster.

You also need to deploy the [mesos-exporter](/prometheus/mesos_exporter) and [node-exporter](github.com/prometheus/node_exporter) to all mesos slaves.

## Prometheus Components
- Server
  - prometheus + mesos-exporter for masters + alertmanager
  - two instances deployed via Universe
- Node-Exporter and Mesos-Exporter for slaves
  - deployed to all DCOS hosts
  - not managed by mesos because no way to guarantee one instance per host when
    scheduled on mesos
