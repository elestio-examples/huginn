apt install pwgen -y

APP_SECRET_TOKEN=`pwgen 128 -A1`

cat << EOT >> ./.env

APP_SECRET_TOKEN=${APP_SECRET_TOKEN}
EOT