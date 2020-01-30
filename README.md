# Simple demo to ship jenkins logs to Elastic Search with Filebeat and Logstash.

## Prerequisites

- [docker]
- [docker-compose]

## Deploy

```bash
git clone https://github.com/dimaunx/jenkins-logs-es.git
cd jenkins-logs-es
make deploy
```

Jenkins will be configured with user and password of **admin**. Two sample jobs will be created.

The default index pattern of **logstash-*** will be created by **setup-kibana** container.

Wait for Kibana to be up (http://localhost:5601). Run the sample jenkins jobs (http://localhost:8080) and 
the logs should appear in Kibana.

## Flow
Jenkins --> jenkins folder <-- FileBeat --> LogStash --> Elastic Search <-- Kibana

Filebeat will ship the logs to Logstash. Logstash will parse the **path** of the log file on the jenkins file system 
and exctract/create two custom fields **jobName** and **buildNum**.

## Ports

Jenkins - http://localhost:8080
Kibana - http://localhost:5601
ElasticSearch - http://localhost:9200

## Cleanup

```bash
make clean
```

<!--links-->
[docker]: https://docs.docker.com/install/
[docker-compose]: https://docs.docker.com/compose/install/