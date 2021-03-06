# Sent.It

_This system register shipments, be aware of the status of shipments and their dates_

## Starting π

_to start we must first have some previous tools installed_

### Rquirements π

_Things you need to install the software_

_php 7.4 or higher_

_composer_

_node v12.18.4 or higher_

### Installation π§
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
create the DB tables there are two options. 
* Laravel Mirgrations
* Run Sql File
##### Sql File
Go to ./sql/sentit_db.sql and execute file in your DB

##### Migrations
$ php artisan migrate


if the php artisan migration command generates an error, it is because of the mysql version, go to the file that is in config / database.php
put the following in mysql section

'engine' => 'InnoDB',

We create x amount of users in the users table for tests with random emails and key equals to password.
$php artisan db:seed

### OAuth Initialization
$php artisan passport:install

### Users you can use
If you choose sql/sentit_db.sql you can use this users:
* adrien30@example.net    Pass: password 
* eli.windler@example.org Pass: password

In both cases Migrations and .sql file you can go to users table copy an email for user and pass allways is set to password


### Running the server β
backοΈ
```
php artisan serve
```
front
```
npm run hot
```

### Project Structure
Here are the most important folders of the project
```bash
.
βββ app (Laravel stuff)
β   βββ Http
β       βββ Controllers (All laravel controllers)
β       βββ Models (Laravel models Eloquent Active Record)
β       βββ Providers
β           βββAppServiceProvide.php (Here you tell laravel Container wich class instantiate depending on interface type)
βββ database
β   βββ migrations (Contain all laravel migrations to create tables)
β   βββ seeders (Contain laravel seeders to create base data )
βββ resources
β   βββ js
β       βββ vue (All Frontend in Vue)
β   βββ sentit (Here is all busines logic)
β       βββ Domains (here are all folders that correspond to the domain)
β           βββDomainFolder (Ex: Cities, Shipments ...)
β               βββ Domain.php (File with busines logic Ex: ShipmentDomain.php)
β               βββ DomainModel.php (File to model entity independient from the framework)
β               βββ EloquentDomainRepository (File that represents the repository for Eloquent Orm)
β       βββ Exceptions ( Custom Exceptions for Busines logic)
β       βββ Repositories (All Repositories interfaces and Repositories super class) 
βββ .env (File to configure all enviroments variables)
βββ README.md
```

### Database Structure
![alt text](https://raw.githubusercontent.com/Alejo5600/imagenes/main/SentItStructure.png)
