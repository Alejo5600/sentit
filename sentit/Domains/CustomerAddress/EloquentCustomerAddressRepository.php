<?php


namespace SentIt\Domains\CustomerAddress;


use SentIt\Repositories\CustomerAddressRepositoryInterface;
use SentIt\Repositories\EloquentRepository;

class EloquentCustomerAddressRepository extends EloquentRepository implements CustomerAddressRepositoryInterface
{

    /**
     * EloquentCustomerAddressRepository constructor.
     */
    public function __construct(\App\Models\CustomerAddress $model)
    {
        $this->model = $model;
    }
}
