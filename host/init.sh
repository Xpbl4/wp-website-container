#!/usr/bin/env bash

if [[ $# -eq 0 ]]; then
  echo "Usage: $0 <template_file> <target_file>"
  echo "Available templates:"
  for entry in "nginx"/*
  do
    echo " - $entry"
  done
  exit 1
fi

template_file=$1
[[ ! -f ${template_file} ]] && echo "Template file not found..." && exit 1;

target_file=$2
[[ -z "${target_file}" ]] && target_file=/dev/stdout;

[[ ! -f ".env" ]] && echo "Environment not configured..." && exit 1

source ".env"
defined_envs=$(printf '${%s} ' $(cat .env | cut -d= -f1))

export HOST_NAME=${HOST_NAME}
export HOST_ALIAS=${HOST_ALIAS}
export HOST_PORT=${HOST_PORT}
export PHP_PORT=${PHP_PORT}

#cat ${template_file} | envsubst "$defined_envs" > ${target_file}
cat ${template_file} | envsubst "$defined_envs" > /etc/nginx/sites-available/${HOST_NAME}
ln -s /etc/nginx/sites-available/${HOST_NAME} /etc/nginx/sites-enabled/${HOST_NAME}


find . -type f -exec chmod 664 {} +
find . -type d -exec chmod 775 {} +
chmod 660 wp-config.php
chown web:www-data -R *
chown web:web ../docker/etc/postfix/sasl_passwd