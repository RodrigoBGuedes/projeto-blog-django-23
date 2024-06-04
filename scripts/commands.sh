#!/bin/sh

set -e

while ! nc -z $POSTGRES_HOST $POSTGRES_PORT; do
    echo " Waiting for Postgres Database Startup ($POSTGRES_HOST $POSTGRES_PORT)..."
    sleep 0.1
done

echo " Postgres Database Startup Sucessfully ($POSTGRES_HOST:$POSTGRES_PORT)"

python manage.py collecstatic
python manage.py migrate
python manage.py runserver