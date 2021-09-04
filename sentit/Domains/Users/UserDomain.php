<?php


namespace SentIt\Domains\Users;


use SentIt\Repositories\UserRepositoryInterface;

class UserDomain
{
    protected UserRepositoryInterface $repository;

    public function __construct(UserRepositoryInterface $repository)
    {
        $this->repository = $repository;
    }
    public function verifyUserCredentials(UserModel $model){
        $user = $this->repository->findByEmail($model->getEmail(),true);
        $login = $user!= null && $model->verifyHashedPassword($user->getPassword());
        $user ? $user->setPassword("") : null;
        return $login ? $user : false;
    }

    public function listar(){
        return $this->repository->all();
    }



}
