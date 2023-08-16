set -o allexport; source .env; set +o allexport;

apt install  -y snapd && snap install bcrypt-tool
PW_HASH=`/snap/bin/bcrypt-tool hash ${ADMIN_PASSWORD} 10`

while ! curl -f http://172.17.0.1:4678; do sleep 5; done

docker-compose exec -T mysql mysql -uroot -p${ADMIN_PASSWORD} huginn -e "UPDATE users SET email='${ADMIN_EMAIL}';"
docker-compose exec -T mysql mysql -uroot -p${ADMIN_PASSWORD} huginn -e "UPDATE users SET encrypted_password='${PW_HASH}' WHERE email='${ADMIN_EMAIL}';"


