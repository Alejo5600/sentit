<?php


namespace SentIt\Domains\Customers;


use SentIt\Exceptions\DomainRuleException;
use SentIt\Repositories\CustomerRepositoryInterface;

class CustomerDomain
{
    private CustomerRepositoryInterface $repository;

    /**
     * CustomerDomain constructor.
     * @param CustomerRepositoryInterface $repository
     */
    public function __construct(CustomerRepositoryInterface $repository)
    {
        $this->repository = $repository;
    }

    public function storeCustomer(CustomerModel $model){
        $this->checkRules($model);
        return $this->repository->create($model->toArray());
    }

    private function checkRules(CustomerModel $model){
        if (empty($model->getName())){
            throw new DomainRuleException("Name is required");
        }
        if (empty($model->getSurname())){
            throw new DomainRuleException("Surname is required");
        }
        if(empty($model->getDocument())){
            throw new DomainRuleException("Document is required");
        }
        $usr = $this->repository->getCustomerByDocument($model->getDocument());
        if($usr){
            throw new DomainRuleException('Customer already exists. Please check the document');
        }
    }

    public function getCustomerByDocuement(string $document){
        return $this->repository->getCustomerByDocument($document);
    }


}
