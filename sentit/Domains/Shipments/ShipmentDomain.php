<?php


namespace SentIt\Domains\Shipments;


use SentIt\Exceptions\DomainRuleException;
use SentIt\Repositories\CustomerAddressRepositoryInterface;
use SentIt\Repositories\CustomerRepositoryInterface;
use SentIt\Repositories\ShipmentRepositoryInterface;
use SentIt\Repositories\StateRepositoryInterface;
use SentIt\Repositories\UserRepositoryInterface;

class ShipmentDomain
{
    protected ShipmentRepositoryInterface $shipmentRepository;
    protected UserRepositoryInterface $userRepository;
    protected CustomerAddressRepositoryInterface $customerAddressRepository;
    protected StateRepositoryInterface $stateRepository;

    /**
     * ShipmentDomain constructor.
     */
    public function __construct(
        ShipmentRepositoryInterface $repository,
        UserRepositoryInterface $userRepository,
        CustomerAddressRepositoryInterface $customerAddressRespository,
        StateRepositoryInterface $stateRepository
    )
    {
        $this->shipmentRepository = $repository;
        $this->userRepository = $userRepository;
        $this->customerAddressRepository = $customerAddressRespository;
        $this->stateRepository = $stateRepository;
    }

    public function getAllShipments(){
        return $this->shipmentRepository->all();
    }

    public function storeShipment(ShipmentModel $model){
        //First we have to check if all foreign columns are ok
        $this->checkRules($model);
        //when all relationships are ok then we create the shipment
        return $this->shipmentRepository->create($model->toArray());
    }

    private function checkRules(ShipmentModel $model){
        $user = $this->userRepository->find($model->getCreatedBy());
        if(!$user){
            throw new DomainRuleException("User doesn't exists");
        }
        $startAddress = $this->customerAddressRepository->find($model->getStartAddress());
        if(!$startAddress){
            throw new DomainRuleException("Start address isn´t created yet!");
        }
        $arrivalAddress = $this->customerAddressRepository->find($model->getArrivalAddress());
        if(!$arrivalAddress){
            throw new DomainRuleException("Arrival address isn´t created yet!");
        }
        $state = $this->stateRepository->find($model->getStateId());
        if(!$state){
            throw new DomainRuleException("Unrecognized state");
        }
    }

    public function updateShipment(ShipmentModel $model,int $shipment_id){
        return $this->shipmentRepository->update($model->toArray(true),$shipment_id);
    }

    public function getShipmentsByCityAndDate(int $city_id,string $date){
        return $this->shipmentRepository->getShipmentsByCityAndDate($city_id,$date);
    }
}
