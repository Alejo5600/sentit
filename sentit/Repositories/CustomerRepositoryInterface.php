<?php


namespace SentIt\Repositories;


interface CustomerRepositoryInterface extends RepositoryInterface
{
    public function getCustomerByDocument(string $document);
}
