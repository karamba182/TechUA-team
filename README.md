# TeachUA-team

![CodeRabbit Pull Request Reviews](https://img.shields.io/coderabbit/prs/github/karamba182/TechUA-team?utm_source=oss&utm_medium=github&utm_campaign=karamba182%2FTechUA-team&labelColor=171717&color=FF570A&link=https%3A%2F%2Fcoderabbit.ai&label=CodeRabbit+Reviews)



## How to clone
```
git clone --recurse-submodules https://github.com/karamba182/TeachUA-team
```

## Archlinux

### BACKEND

To clone the repo and install all of the dependencies:
```
cd TeachUA-team/backend
sudo pacman -Syu nvm postgresql maven nginx
```

For the backend to work, you'll need to set up the database:
```
sudo su postgres
initdb -D /var/lib/postgres/data
exit
sudo systemctl start postgresql
sudo su postgres
psql
create role teachua_user login password 'teachua_password';
create database teachua owner teachua_user;
exit
exit
```
Once the database is set up you'll need to load the necessary environment
variables:
```
. ./setenv.sh
```
Now, we'll need to initialize our new database:
```
mvn package -DskipTests
java -jar target/dev.war
```
If it launched successfully, interrupt the process with Ctrl-C.
Now, rebuild it with a slightly different configuration file, to add the
necessary tables to the database:
```
sed -i 's/^#\(spring\.sql\.init\.mode=always\)/\1/' src/main/resources/application-dev.properties
mvn clean
mvn package -DskipTests
java -jar target/dev.war
```
Now, interrupt the process with Ctrl-C, and when the database is ready, revert
the thanged config file to its initial state and rebuild it again:
```
sed -i 's/^\(spring\.sql\.init\.mode=always\)/#\1/' src/main/resources/application-dev.properties
mvn clean
mvn package -DskipTests
```
Now, the backend part is ready to start:
```
java -jar target/dev.war
```

### FRONTEND
To start with, prepare the necessary environment:
```
cd TeachUA-team/frontend
source /usr/share/nvm/init-nvm.sh
nvm install v14.17.4
nvm use v14.17.4
source /usr/share/nvm/init-nvm.sh
```
Now, we'll need to change some configuration a lil' bit:
```
sed -i '/speak-ukrainian/s/^.*$/##&/' .env.production
sed -i '/localhost/s/^##\(.*\)$/\1/' .env.production
```
Then, install all of the necessary modules:
```
npm i
npm i ajv
```
Now, the frontend part is ready to be built:
```
npm run build
```
Now, the webpage is ready, the only thing left is to configure the nginx web
server:
```
sudo mv /etc/nginx/nginx.conf{,.back}
cat << 'EOF' | sudo tee /etc/nginx/nginx.conf
> events {
  worker_connections 1024;
}

http {
  include       mime.types;
  server {
    listen 80;
    root /usr/share/nginx/html;
    try_files $uri /index.html;

    location /api {
      proxy_pass http://localhost:8080;
    }

    location /oauth2 {
      proxy_pass http://localhost:8080;
    }

    location /upload {
      proxy_pass http://localhost:8080;
    }

    location /swagger-ui {
      proxy_pass http://localhost:8080;
    }
  }
}
> EOF
sudo mv /usr/share/nginx/html{,.back}
sudo cp -r build /usr/share/nginx/html
sudo chown -R http:http /usr/share/nginx/html
```
Now, when everything is ready, we can start the nginx server:
```
sudo systemctl start nginx
```
