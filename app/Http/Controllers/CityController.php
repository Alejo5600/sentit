<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use SentIt\Domains\Cities\CityDomain;
use SentIt\Repositories\CityRepositoryInterface;

class CityController extends Controller
{
    private CityDomain $cityDomain;
    /**
     * CityController constructor.
     */
    public function __construct(CityRepositoryInterface $repository)
    {
        $this->cityDomain = new CityDomain($repository);
    }

    public function index(){
        try{
            $cities = $this->cityDomain->getCities();
            return response()->json(array(
                'success' => true,
                'cities' => $cities
            ));
        }catch (\Exception $ex){
            return response()->json(array('success'=> false));
        }
    }
}
