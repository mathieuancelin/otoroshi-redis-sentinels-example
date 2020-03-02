# Otoroshi with Redis Sentinels

You will need docker, docker-compose, curl and a JDK 11

## Setup

```sh
git clone https://github.com/mathieuancelin/otoroshi-redis-sentinels-example.git
cd otoroshi-redis-sentinels-example
```

## Run the test

in a new bash session

```sh
sh ./run.sh
```

## Test it

```sh
curl http://127.0.0.1:8080/metrics
open http://otoroshi.oto.tools:8080 # login with admin@otoroshi.io / password
```

## Debug

```sh
docker run -it --rm redis redis-cli -h my-ip-address -p 6401 info | grep role
docker run -it --rm redis redis-cli -h my-ip-address -p 26401 SENTINEL get-master-addr-by-name my_redis_master
```