<?php


namespace SentIt\Domains\Cities;


use SentIt\Repositories\CityRepositoryInterface;

class CityDomain
{
    private CityRepositoryInterface $repository;

    /**
     * CityDomain constructor.
     * @param CityRepositoryInterface $repository
     */
    public function __construct(CityRepositoryInterface $repository)
    {
        $this->repository = $repository;
    }

    public function getCities(){
        return $this->repository->all();
    }


}
