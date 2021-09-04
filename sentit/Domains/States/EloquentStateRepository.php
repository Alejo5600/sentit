<?php


namespace SentIt\Domains\States;


use SentIt\Repositories\EloquentRepository;
use SentIt\Repositories\StateRepositoryInterface;

class EloquentStateRepository extends EloquentRepository implements StateRepositoryInterface
{

    /**
     * EloquentStateRepository constructor.
     */
    public function __construct(\App\Models\State $model)
    {
        $this->model = $model;
    }
}
