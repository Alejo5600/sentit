<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
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

            DB::connection()->enableQueryLog();
            $shipments = $this->shipmentDomain->getAllShipments();
            $queries = DB::getQueryLog();

            return response()->json(array(
                'success' => true,
                'shipments' => $shipments,
                'queries' => $queries
            ));
        }catch (\Exception $ex){
            return response()->json(array('success' => false,'msg'=>$ex->getMessage()));
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

            return response()->json(array(
               'success' => true,
               'shipment' => $this->shipmentDomain->storeShipment($model)
            ));
        }catch (DomainRuleException $ex){
            return response()->json(array('success' => false,'msg'=>$ex->getMessage()));
        }catch (\Exception $ex){
            return response()->json(array('success' => false));
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
            return response()->json(array('success' => $updated == 1));
        }catch (\Exception $ex){
            return response()->json(array('success' => false));
        }

    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {

    }
}
