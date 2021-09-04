<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use SentIt\Domains\Customers\CustomerDomain;
use SentIt\Domains\Customers\CustomerModel;
use SentIt\Exceptions\DomainRuleException;
use SentIt\Repositories\CustomerRepositoryInterface;

class CustomerController extends Controller
{
    private CustomerDomain $customerDomain;
    /**
     * CustomerController constructor.
     */
    public function __construct(CustomerRepositoryInterface $customerRepository)
    {
        $this->customerDomain = new CustomerDomain($customerRepository);
    }

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
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
            $model = new CustomerModel($request->all());
            $customer = $this->customerDomain->storeCustomer($model);
            return response()->json(array(
                'success' => true,
                'cutomer' => $customer
            ));
        }catch (DomainRuleException $ex){
            return response()->json(array('success' => false,'msg'=>$ex->getMessage()));
        }catch (\Exception $ex){
            return response()->json(array('success' => false));
        }
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
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
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }

    public function getByDocument($document){
        try{
            $customer = $this->customerDomain->getCustomerByDocuement($document);
            return response()->json(array(
                'success' => $customer ? true : false,
                'customer' => $customer
            ));
        }catch (\Exception $ex){
            return response()->json(array('success' => false));
        }

    }
}
