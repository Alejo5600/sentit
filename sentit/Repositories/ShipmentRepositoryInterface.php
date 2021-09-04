<?php


namespace SentIt\Repositories;


interface ShipmentRepositoryInterface extends RepositoryInterface
{
    public function getShipmentsByCityAndDate(int $city_id,string $date);
    public function changeShipmentState(int $shipment_id,int $satate_id);

}
