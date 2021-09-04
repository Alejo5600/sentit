<?php


namespace SentIt\Domains\Cities;


use App\Models\City;
use SentIt\Repositories\CityRepositoryInterface;
use SentIt\Repositories\EloquentRepository;

class EloquentCityRepository extends EloquentRepository implements CityRepositoryInterface
{


    /**
     * EloquentCityRepository constructor.
     */
    public function __construct(City $model)
    {
        $this->model = $model;
    }
}
