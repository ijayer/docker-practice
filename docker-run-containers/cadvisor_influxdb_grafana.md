Docker Run Containers
=====================

# cAdvisor

run.sh:

```bash
#!/bin/sh

set -e

docker run --name cadvisor --net monitor --restart always -p 8080:8080 --volume=/:/rootfs:ro --volume=/var/run:/var/run:rw --volume=/sys:/sys:ro --volume=/var/lib/docker/:/var/lib/docker:ro --volume=/cgroup:/cgroup:ro --privileged=true --userns=host -d google/cadvisor -storage_driver=influxdb -storage_driver_db=cadvisor -storage_driver_host=influxdb:8086
echo
docker ps | grep cadvisor
```

# Grafana

run.sh:

```bash
#!/bin/sh

set -e

ID=$(id -u)
docker run --name grafana --net monitor --restart always --user $ID --volume "$PWD/data:/var/lib/grafana" --volume "$PWD/grafana.ini:/etc/grafana/grafana.ini" -p 3000:3000 -d grafana/grafana
echo
docker ps | grep grafana
```

upcfg.sh

```bash
#!/bin/sh

set -e

docker cp ./grafana.ini grafana:/etc/grafana/grafana.ini
```

# InfluxDB

run.sh:

```bash
#!/bin/sh

set -e

docker run --name influxdb --net monitor --restart always -v "$PWD/config.toml:/config/config.toml" -v "$PWD/data:/data" -p 8083:8083 -p 8086:8086 -d tutum/influxdb
echo
docker ps | grep influxdb
```
