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


### Running the server ⚙
back️
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
├── app (Laravel stuff)
│   ├── Http
│       ├── Controllers (All laravel controllers)
│       ├── Models (Laravel models Eloquent Active Record)
│       └── Providers
│           ├──AppServiceProvide.php (Here you tell laravel Container wich class instantiate depending on interface type)
├── database
│   ├── migrations (Contain all laravel migrations to create tables)
│   └── seeders (Contain laravel seeders to create base data )
├── resources
│   ├── js
│       └── vue (All Frontend in Vue)
│   ├── sentit (Here is all busines logic)
│       ├── Domains (here are all folders that correspond to the domain)
│           └──DomainFolder (Ex: Cities, Shipments ...)
│               ├── Domain.php (File with busines logic Ex: ShipmentDomain.php)
│               ├── DomainModel.php (File to model entity independient from the framework)
│               └── EloquentDomainRepository (File that represents the repository for Eloquent Orm)
│       ├── Exceptions ( Custom Exceptions for Busines logic)
│       ├── Repositories (All Repositories interfaces and Repositories super class) 
├── .env (File to configure all enviroments variables)
└── README.md
```

### Database Structure
![alt text](https://raw.githubusercontent.com/Alejo5600/imagenes/main/SentItStructure.png)
