# Sent.It

_This system register shipments, be aware of the status of shipments and their dates_

## Starting 🚀

_to start we must first have some previous tools installed_

### Rquirements 📋

_Things you need to install the software_

_php 7.4 or higher_

_composer_

_node v12.18.4 or higher_

### Installation 🔧
$ Clone repository

$ https://github.com/Alejo5600/sentit

$ cd sentit

$ composer install

$ npm install

In the root, create a file called .env and copy what is inside the file .env.example
or just rename the .env.example file to .env

$ php artisan key:generate

create a database called sentit
and configure in the .env
```
DB_CONNECTION=mysql
DB_HOST=127.0.0.1
DB_PORT=3306
DB_DATABASE=sentit
DB_USERNAME=root
DB_PASSWORD=
```
create the tables in the db
$php artisan migrate


if the php artisan migration command generates an error, it is because of the mysql version, go to the file that is in config / database.php
put the following in mysql section

'engine' => 'InnoDB',

We create x amount of users in the users table for tests with random emails and key equals to password.
$php artisan db:seed

$php artisan passport:install

### Running the server ⚙
back️
```
php artisan serve
```
front
```
npm run hot
```

