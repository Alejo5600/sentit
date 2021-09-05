<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

/*Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});*/

Route::post('login',[\App\Http\Controllers\UserController::class,'login']);
Route::middleware('auth:api')->group(function(){
    Route::get('users',[\App\Http\Controllers\UserController::class,'listar']);
    Route::resource('shipments',\App\Http\Controllers\ShipmentController::class);
    Route::resource('Customers',\App\Http\Controllers\CustomerController::class);
    Route::prefix('Customer')->group(function (){
        Route::get('/getByDocument/{document}',[\App\Http\Controllers\CustomerController::class,'getByDocument']);
    });
    Route::get('cities',[\App\Http\Controllers\CityController::class,'index']);
    Route::get('shipmentsByCity/{city}/{date}',[\App\Http\Controllers\ShipmentController::class,'getShipmentsByCity']);
    Route::put('shipmentState',[\App\Http\Controllers\ShipmentController::class,'changeShipmentState']);
    Route::get('logout',[\App\Http\Controllers\UserController::class,'logout']);
});


