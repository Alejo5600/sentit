<?php


namespace SentIt\Repositories;


use SentIt\Repositories\RepositoryInterface;
use SentIt\Domains\Users\UserModel;


interface UserRepositoryInterface extends RepositoryInterface
{
    public function findByEmail(string $email,bool $withPass = false) : ?UserModel ;

}
