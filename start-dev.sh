#!/bin/bash

bundle check || bundle install || bundle update

yarn install
>&2 echo "=========== YARN RUNNED"

while ! pg_isready -h lendbike-db -p 5432 -q -U postgres; do
	>&2 echo "postgres is unavailable"
	sleep 1
done


>&2 echo "postgres is up"

if !(bundle exec rake db:migrate); then
  >&2 echo "=========== DATABASE DOES NOT EXIST... yet"
	bundle exec rake db:create
	>&2 echo "=========== DATABASE CREATED"
	bundle exec rake db:migrate
	>&2 echo "=========== DATABASE MIGRATED"
else
  >&2 echo "=========== DATABASE EXIST.... yay"
	bundle exec rake db:migrate
	>&2 echo "=========== DATABASE MIGRATED (already exists)"
fi

bundle exec rake db:seed
>&2 echo "=========== DATABASE SEEDED"

>&2 echo "=========== localhost:3000"
bundle exec rails s -p 3000 -b '0.0.0.0'