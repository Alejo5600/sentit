<?php


namespace SentIt\Domains\Cities;


use SentIt\ModelDomain\ModelDomain;

class CityModel extends ModelDomain
{
    private ?int $city_id;
    private ?string $name;

    /**
     * @return int|null
     */
    public function getCityId(): ?int
    {
        return $this->city_id;
    }

    /**
     * @param int|null $city_id
     */
    public function setCityId(?int $city_id): void
    {
        $this->city_id = $city_id;
    }

    /**
     * @return string|null
     */
    public function getName(): ?string
    {
        return $this->name;
    }

    /**
     * @param string|null $name
     */
    public function setName(?string $name): void
    {
        $this->name = $name;
    }


}
