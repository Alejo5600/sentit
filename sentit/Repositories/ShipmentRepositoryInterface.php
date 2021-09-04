<?php


namespace SentIt\Repositories;


interface ShipmentRepositoryInterface extends RepositoryInterface
{
    public function getShipmentsByCityAndDate(int $city_id,string $date);

}
