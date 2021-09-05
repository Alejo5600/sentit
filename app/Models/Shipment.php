<?php

namespace App\Models;


use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Shipment extends Model
{
    use HasFactory;
    protected $primaryKey = 'shipment_id';
    protected $fillable = ['description','shipment_date','delivery_date','start_address','arrival_address','created_by','state_id'];

    function start_adress_obj(){
        return $this
            ->belongsTo(CustomerAddress::class,'start_address','customer_address_id')
            ->with(['customer','city']);
    }

    function arrival_adress_obj(){
        return $this->belongsTo(CustomerAddress::class,'arrival_address','customer_address_id')
            ->with(['customer','city']);
    }

    function sender(){
        return $this->hasOneThrough(
            Customer::class,
            CustomerAddress::class,
            'customer_id',
            'customer_id',
            'shipment_id',
            'customer_address_id'
        );
    }
    function receiver(){
        return $this->hasOneThrough(
            Customer::class,
            CustomerAddress::class,
            'customer_id',
            'customer_id',
            'shipment_id',
            'customer_address_id'
        );
    }

    function initial_city(){
        return $this->hasOneThrough(
            City::class,
            CustomerAddress::class,
            'city_id',
            'city_id',
            'start_address',
            'customer_address_id'
        );
    }

    function end_city(){
        return $this->hasOneThrough(
            City::class,
            CustomerAddress::class,
            'city_id',
            'city_id',
            'arrival_address',
            'customer_address_id'
        );
    }

    public function state(){
        return $this->belongsTo(
            State::class,
            'state_id',
            'state_id'
        );
    }

}
