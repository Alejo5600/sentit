<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Customer extends Model
{
    use HasFactory;
    protected $primaryKey = 'customer_id';
    protected $fillable = ['customer_id','name','document','surname'];

    public function addresses(){
        return $this->hasMany(CustomerAddress::class,'customer_id','customer_id');
    }
}
