<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class CustomerAddress extends Model
{
    use HasFactory;
    protected $primaryKey = 'customer_address_id';

    public function customer(){
        return $this->belongsTo(Customer::class,'customer_id','customer_id');
    }
    public function city(){
        return $this->belongsTo(City::class,'city_id','city_id');
    }
}
