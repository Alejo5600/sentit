<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Shipment extends Model
{
    use HasFactory;
    protected $primaryKey = 'shipment_id';
    protected $fillable = ['description','shipment_date','start_address','arrival_address','created_by','state_id'];
}
