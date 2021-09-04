<?php

namespace App\Providers;

use Illuminate\Support\ServiceProvider;


class AppServiceProvider extends ServiceProvider
{
    /**
     * Register any application services.
     *
     * @return void
     */
    public function register()
    {
        $this->bindRepositories();


    }
    //
    //
    private $repositories = array(
        ['SentIt\Repositories\UserRepositoryInterface','SentIt\Domains\Users\EloquentUserRepository'],
        ['SentIt\Repositories\ShipmentRepositoryInterface','SentIt\Domains\Shipments\EloquentShipmentRepository'],
        ['SentIt\Repositories\CustomerAddressRepositoryInterface','SentIt\Domains\CustomerAddress\EloquentCustomerAddressRepository'],
        ['SentIt\Repositories\CustomerRepositoryInterface','SentIt\Domains\Customers\EloquentCustomerRepository'],
        ['SentIt\Repositories\StateRepositoryInterface','SentIt\Domains\States\EloquentStateRepository'],
    );

    private function bindRepositories(){
        foreach ($this->repositories as $repo){
            list($abstract,$concrete) = $repo;
            $this->app->bind($abstract,$concrete);
        }
    }

    /**
     * Bootstrap any application services.
     *
     * @return void
     */
    public function boot()
    {
        //
    }
}
