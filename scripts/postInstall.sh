#set env vars
set -o allexport; source .env; set +o allexport;

#wait until the server is ready
echo "Waiting for software to be ready ..."
sleep 120s;


  # docker-compose exec -T baserow curl -X POST -H 'Content-Type: application/json' -i https://${DOMAIN}/api/user/ --data '{ "name": "Admin", "email": "'${ADMIN_EMAIL}'", "password": "'${ADMIN_PASSWORD}'" }'

curl https://${DOMAIN}/api/user/ \
  -H 'accept: application/json' \
  -H 'accept-language: fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7,he;q=0.6,zh-CN;q=0.5,zh;q=0.4,ja;q=0.3' \
  -H 'cache-control: no-cache' \
  -H 'content-type: application/json' \
  -H 'pragma: no-cache' \
  -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/122.0.0.0 Safari/537.36' \
  --data-raw '{"name":"Admin","email":"'${ADMIN_EMAIL}'","password":"'${ADMIN_PASSWORD}'","authenticate":true,"language":"en"}'
