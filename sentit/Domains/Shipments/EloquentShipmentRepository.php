<?php


namespace SentIt\Domains\Shipments;


use Illuminate\Database\Eloquent\ModelNotFoundException;
use SentIt\Repositories\EloquentRepository;
use SentIt\Repositories\ShipmentRepositoryInterface;

class EloquentShipmentRepository extends EloquentRepository implements ShipmentRepositoryInterface
{
    private $relationships = [
        'receiver',
        'sender',
        'initial_city',
        'end_city',
        'state',
        'start_adress_obj',
        'arrival_adress_obj',
    ];
    /**
     * EloquentShipmentRepository constructor.
     */
    public function __construct(\App\Models\Shipment $model)
    {
        $this->model = $model;
    }

    public function all()
    {
        return $this->model->with($this->relationships)->get();
    }

    public function find(int $id)
    {
        return $this->model
            ->with($this->relationships)
            ->where($this->model->getKeyName(), $id)
            ->first();
    }


    public function getShipmentsByCityAndDate(int $city_id, string $date)
    {
        return $this->model
            ->with($this->relationships)
            ->whereIn('arrival_address',function ($query) use($city_id){
                $query->select('customer_address_id')
                    ->from('customer_addresses')
                    ->where('city_id',$city_id);
            })
            ->whereRaw('CAST(delivery_date as date) = CAST(? as date)',[$date])
            ->get();
    }

    public function changeShipmentState(int $shipment_id, int $state_id)
    {
        return $this->update(['state_id'=>$state_id],$shipment_id);

    }
}
