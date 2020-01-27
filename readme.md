# Otoroshi with Redis Sentinels

You will need docker, docker-compose, curl and a JDK 11

## Setup

```sh
git clone https://github.com/mathieuancelin/otoroshi-redis-sentinels-example.git
cd otoroshi-redis-sentinels-example
# WARNING: here use your own ip address on the LAN instead of 192.168.1.14
sed -i -e "s/IPADDRESS/192.168.1.14/g" sentinel*.conf
```

## Run Redis

in a new bash session

```sh
docker-compose up
```

## Run otoroshi

in a new bash session

```sh
curl -L -o otoroshi.jar 'https://github.com/MAIF/otoroshi/releases/download/v1.4.19/otoroshi.jar'
java \
  -Dapp.storage=redis-sentinel-lf \
  -Dapp.redis.sentinels.lf.members.0.host=127.0.0.1 \
  -Dapp.redis.sentinels.lf.members.1.host=127.0.0.1 \
  -Dapp.redis.sentinels.lf.members.2.host=127.0.0.1 \
  -Dapp.redis.sentinels.lf.members.0.port=26401 \
  -Dapp.redis.sentinels.lf.members.1.port=26402 \
  -Dapp.redis.sentinels.lf.members.2.port=26403 \
  -Dapp.redis.sentinels.lf.master=my_redis_master \
  -Dapp.adminPassword=password \
  -jar otoroshi.jar
```

## Test it

```sh
curl http://127.0.0.1:8080/metrics
open http://otoroshi.oto.tools:8080 # login with admin@otoroshi.io / password
```