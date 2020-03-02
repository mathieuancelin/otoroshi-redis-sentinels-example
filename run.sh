rm -f ./sentinel*.conf
cp ./template/sentinel* .
chmod 777 sentinel*.conf
docker-compose up -d
docker-compose logs -f 
docker-compose down