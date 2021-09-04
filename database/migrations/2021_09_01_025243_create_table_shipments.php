<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateTableShipments extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('shipments', function (Blueprint $table) {
            $table->id('shipment_id');
            $table->text('description');
            $table->dateTimeTz('shipment_date')->nullable();
            $table->dateTimeTz('delivery_date')->nullable();
            $table->foreignId('start_address')->references('customer_address_id')->on('customer_addresses');
            $table->foreignId('arrival_address')->references('customer_address_id')->on('customer_addresses');
            $table->foreignId('state_id')->references('state_id')->on('states');
            $table->foreignId('created_by')->references('user_id')->on('users');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('table_shipments');
    }
}
