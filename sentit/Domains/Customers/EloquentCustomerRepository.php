<?php


namespace SentIt\Domains\Customers;


use SentIt\Repositories\CustomerRepositoryInterface;
use SentIt\Repositories\EloquentRepository;

class EloquentCustomerRepository extends EloquentRepository implements CustomerRepositoryInterface
{

    /**
     * EloquentCustomerRepository constructor.
     */
    public function __construct(\App\Models\Customer $model)
    {
        $this->model = $model;
    }


    public function getCustomerByDocument(string $document)
    {
        return $this->model->with(['addresses'])->where('document',$document)->first();
    }
}
