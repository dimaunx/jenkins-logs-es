# Simple demo to ship jenkins logs to Elastic Search with Filebeat and Logstash.

## Deploy

```bash
git clone git clone https://github.com/dimaunx/jenkins-logs-es.git
cd jenkins-logs-es
mkdir jenkins
sudo chown 1000 jenkins
docker-compose up -d
```

Get jenkins initial password. Wait for 30 seconds for jenkins to startup. 

```bash
docker-compose exec jenkins cat /var/jenkins_home/secrets/initialAdminPassword
```

Finish [jenkins configuration].


## Flow
Jenkins --> jenkins folder <-- Filebat --> Logstash --> Elatic Search <-- Kibana

Logstash will get the logs from Filebeat and parse the path of the log file on the jenkins file system and generate two
custom fields jobName and jobNumber.

## Ports

Jenkins - http://localhost:8080

Kibana - http://localhost:5601

## Cleanup

```bash
docker-compose down -v
sudo rm -rf jenkins
```

<!--links-->
[index pattern]: https://www.elastic.co/guide/en/kibana/current/tutorial-define-index.html
[jenkins configuration]: http://www.javasavvy.com/jenkins-installation/