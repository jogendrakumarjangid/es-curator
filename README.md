[![Build Status](https://travis-ci.org/jogendrajangid1/es-curator.svg?branch=master)](https://travis-ci.org/jogendrajangid1/es-curator)

[Docker hub image](https://hub.docker.com/r/jogendrajangid/es-curator/)
### Configuration Environment Variables

This image will periodically run .
* **PERIOD** : defines period (in seconds) between runs of curator; default is 86400 seconds (1 day)
* **ES_HOST** : defines the hostname of the Elasticsearch node to contact; default is master
* **DELETE_AGE** : defines what age (and older) of indices will be deleted; default is 45

### Configuration filters

The image comes with basic, but functional, configuration files that utilize
the environment variables above. The actions configuraion will delete indices
that are prefixed with "filebeat-", "logstash-" or "metricbeat-" that are older than
`$DELETE_AGE`.

The configuration files are:

* **/etc/curator/config.yml**
* **/etc/curator/actions.yml**

### Executing container
docker run -it -d --name es-curator -e PERIOD=86400 -e ES_HOST=elasticsearch-host -e DELETE_AGE=45 jogendrajangid/es-curator

You can replace execting configuration file by attachment over the directory using '-v' like.

docker run -it -d --name es-curator -v configpath:/etc/curator -e PERIOD=86400 -e ES_HOST=elasticsearch-host -e DELETE_AGE=45 jogendrajangid/es-curator

Note: We have used sleep $PERIOD in the startup script. Process will be in sleep mode in the container and execute in the $PERIOD interval

For more information :- [elasticsearch-curator](https://www.elastic.co/guide/en/elasticsearch/client/curator/5.0/about.html)
----
