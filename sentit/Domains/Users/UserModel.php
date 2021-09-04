<?php


namespace SentIt\Domains\Users;


use SentIt\ModelDomain\ModelDomain;

class UserModel extends ModelDomain
{
    protected int $user_id = 0;
    protected string $name = '';
    protected string $surname = '';
    protected string $password = '';
    protected string $email = '';


    public function verifyHashedPassword(string $hash){
        return password_verify($this->getPassword(),$hash);
    }

    public function getUserId(): int
    {
        return $this->user_id;
    }


    public function setUserId(int $user_id): void
    {
        $this->user_id = $user_id;
    }


    public function getName(): string
    {
        return $this->name;
    }


    public function setName(string $name): void
    {
        $this->name = $name;
    }


    public function getSurname(): string
    {
        return $this->surname;
    }


    public function setSurname(string $surname): void
    {
        $this->surname = $surname;
    }


    public function getPassword(): string
    {
        return $this->password;
    }


    public function setPassword(string $password): void
    {
        $this->password = $password;
    }


    public function getEmail(): string
    {
        return $this->email;
    }


    public function setEmail(string $email): void
    {
        $this->email = $email;
    }




}
