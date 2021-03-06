<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use SentIt\Exceptions\DomainRuleException;
use SentIt\Repositories\CustomerAddressRepositoryInterface;
use SentIt\Repositories\ShipmentRepositoryInterface;
use SentIt\Domains\Shipments\ShipmentDomain;
use SentIt\Domains\Shipments\ShipmentModel;
use SentIt\Repositories\StateRepositoryInterface;
use SentIt\Repositories\UserRepositoryInterface;

class ShipmentController extends Controller
{
    protected $shipmentDomain;

    public function __construct(
        ShipmentRepositoryInterface $repository,
        UserRepositoryInterface $userRepository,
        CustomerAddressRepositoryInterface $customerAddressRespository,
        StateRepositoryInterface $stateRepository
    )
    {
        $this->shipmentDomain =
            new ShipmentDomain(
                $repository,
                $userRepository,
                $customerAddressRespository,
                $stateRepository
            );
    }
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        try {
            $shipments = $this->shipmentDomain->getAllShipments();
            return response()->json(array(
                'success' => true,
                'shipments' => $shipments,
            ));
        }catch (\Exception $ex){
            return response()->json(array('success' => false,'msg'=>$ex->getMessage()));
        }
    }

    public function show($id){
        try{
            $shipment = $this->shipmentDomain->findShipment($id);
            return response()->json(array(
                'success'=> true,
                'shipment' => $shipment
            ));
        }catch (\Exception $ex){
            return response()->json(array('success'=>false));
        }
    }


    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        try{
            $model = new ShipmentModel($request->all());
            $model->setCreatedBy(Auth::user()->user_id);
            return response()->json(array(
               'success' => true,
               'shipment' => $this->shipmentDomain->storeShipment($model)
            ));
        }catch (DomainRuleException $ex){
            return response()->json(array('success' => false,'msg'=>$ex->getMessage()));
        }catch (\Exception $ex){
            return response()->json(array('success' => false,'msg'=>$ex->getMessage()));
        }
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        try{
            $model = new ShipmentModel($request->all());
            $model->setStateId($request->get('state_id'));
            $updated = $this->shipmentDomain->updateShipment($model,$id);
            return response()->json(array('success' => $updated == 1,'updated'=>$updated));
        }catch (\Exception $ex){
            return response()->json(array('success' => false,'msg'=>$ex->getMessage()));
        }

    }

    public function getShipmentsByCity($city,$date){
        try{
            $shipments = $this->shipmentDomain->getShipmentsByCityAndDate($city,$date);
            return response()->json(array(
                'success' => true,
                'shipments' => $shipments
            ));
        }catch (\Exception $ex){
            return response()->json(array('success'=>false));
        }
    }

    public function changeShipmentState(Request $request){
        try{
            $shipment_id = $request->get('shipment');
            $state_id = $request->get('state');
            $updated = $this->shipmentDomain->changeShipmentState($shipment_id,$state_id);
            return response()->json(array('success' => $updated ? true : false));
        }catch (\Exception $ex){
            return response()->json(array('success'=>false));
        }
    }
}
