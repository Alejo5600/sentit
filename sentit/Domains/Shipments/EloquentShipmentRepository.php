<?php


namespace SentIt\Domains\Shipments;


use SentIt\Repositories\EloquentRepository;
use SentIt\Repositories\ShipmentRepositoryInterface;

class EloquentShipmentRepository extends EloquentRepository implements ShipmentRepositoryInterface
{

    public function all()
    {
        return $this->model->with(
            [
                'receiver',
                'sender',
                'initial_city',
                'end_city',
                'state'
            ]
        )->get();
    }

    /**
     * EloquentShipmentRepository constructor.
     */
    public function __construct(\App\Models\Shipment $model)
    {
        $this->model = $model;
    }
}
