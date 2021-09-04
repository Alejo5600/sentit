<?php


namespace SentIt\Domains\Shipments;


use SentIt\Repositories\EloquentRepository;
use SentIt\Repositories\ShipmentRepositoryInterface;

class EloquentShipmentRepository extends EloquentRepository implements ShipmentRepositoryInterface
{


    /**
     * EloquentShipmentRepository constructor.
     */
    public function __construct(\App\Models\Shipment $model)
    {
        $this->model = $model;
    }
}
