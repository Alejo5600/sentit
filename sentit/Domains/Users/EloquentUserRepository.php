<?php


namespace SentIt\Domains\Users;

use Illuminate\Database\Eloquent\ModelNotFoundException;
use SentIt\Repositories\EloquentRepository;
use SentIt\Repositories\UserRepositoryInterface;

class EloquentUserRepository extends EloquentRepository implements UserRepositoryInterface
{

    public function __construct(\App\Models\User $user)
    {
        $this->model = $user;
    }

    public function findByEmail(string $email,bool $withPass = false) : ?UserModel{
        $result = $this->model->where('email',$email)->first();
        $model = $result? new UserModel( $result->toArray() ) : null;
        $model ? $model->setPassword($withPass? $result->password : "") : null;
        return $model;
    }
}
