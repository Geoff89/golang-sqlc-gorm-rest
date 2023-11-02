## relevant packages for golang project
curl -L https://packagecloud.io/golang-migrate/migrate/gpgkey | apt-key add -
echo "deb https://packagecloud.io/golang-migrate/migrate/ubuntu/ $(lsb_release -sc) main" > /etc/apt/sources.list.d/migrate.list
apt-get update
apt-get install -y migrate

go install github.com/sqlc-dev/sqlc/cmd/sqlc@latest
go install github.com/cosmtrek/air@latest
go get github.com/lib/pq
go get github.com/spf13/viper
go get -u github.com/gin-gonic/gin


## commands for migration
- migrate create -ext sql -dir db/migration -seq init_schema

## install postgres uuid-ossp plugin
- docker exec -it postgres bash
- docker exec -it postgres /bin/sh
- psql -U root contact_db
- select * from pg_available_extensions;
- CREATE EXTENSION IF NOT EXISTS  "uuid-ossp";

## You can quit the psql shell \q
- \q
- then exit \exit

## Run migrate command to execute up migration. This will push the table in the database
- migrate -path db/migration -database "postgresql://root:secret@localhost:5432/contact_db?sslmode=disable" -verbose up 
- migrate -path db/migration -database "postgresql://root:secret@localhost:5432/contact_db?sslmode=disable" -verbose down

## step 3 - Generate the CRUD Functions with sqlc
- sqlc init
- sqlc generate

## Create controllers
- local host is http://localhost:8000/api/posts

## downloading pgadmin as a container and starting it
- docker pull dpage/pgadmin4
- docker run --name my-pgadmin -p 82:80 -e 'PGADMIN_DEFAULT_EMAIL=laiba@yahoo.com' -e   'PGADMIN_DEFAULT_PASSWORD=pass123' -d dpage/pgadmin4
- Navigate to `http://localhost:82/` to access the webbrowser for pgadmin and get started
