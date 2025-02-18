# KRAFT Trouble Shooting

## Trouble Shooting

### docker volume permission

```sh
sudo chown -R 1000:1000 /data/kafka*
sudo chmod -R 775 /data/kafka*
```

### KRaft mode requires an unique node.id, please set the environment variable KAFKA_CFG_NODE_ID

```sh
kafka 05:59:48.86 INFO  ==> ** Starting Kafka setup **
kafka 05:59:52.93 ERROR ==> KRaft mode requires an unique node.id, please set the environment variable KAFKA_CFG_NODE_ID
/opt/bitnami/scripts/libkafka.sh: line 377: KAFKA_CFG_LISTENER_SECURITY_PROTOCOL_MAP: unbound variable
kafka 05:59:52.96 WARN  ==> Kafka has been configured with a PLAINTEXT listener, this setting is not recommended for production environments.
```

- kraft 사용 시, KAFKA_CFG_NODE_ID 설정해줘야 함
- KAFKA_CFG_LISTENER_SECURITY_PROTOCOL_MAP
- Require Environment
    - KAFKA_CFG_NODE_ID
    - KAFKA_CFG_CLUSTER_ID

###  Error while writing meta.properties file

```sh
===> Running in KRaft mode, skipping Zookeeper health check...
===> Using provided cluster id ciWo7IWazngRchmPES6q5A== ...
Formatting /data/kafka2 with metadata.version 3.8-IV0. Error while writing meta.properties file /data/kafka2: /data/kafka2/bootstrap.checkpoint.tmp
```

- 해당 폴더에 접근할 수 있는 권한을 확인해봐야 함

```sh
    ls -al

    ## 권한추가
    sudo chown -R root data
```

## Reference

- https://levelup.gitconnected.com/kraft-kafka-cluster-with-docker-e79a97d19f2c