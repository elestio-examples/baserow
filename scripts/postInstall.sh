#set env vars
set -o allexport; source .env; set +o allexport;

#wait until the server is ready
echo "Waiting for software to be ready ..."
sleep 30s;


  docker-compose exec -T baserow curl -X POST -H 'Content-Type: application/json' -i http://localhost/api/user/ --data '{ "name": "Admin", "email": "'${ADMIN_EMAIL}'", "password": "'${ADMIN_PASSWORD}'" }'