<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Psy\Util\Str;
use SentIt\Repositories\UserRepositoryInterface;
use SentIt\Domains\Users\UserDomain;
use SentIt\Domains\Users\UserModel;

class UserController extends Controller
{
    private UserDomain $userDomain;

    public function __construct(UserRepositoryInterface $repository)
    {
        $this->userDomain = new UserDomain($repository);
    }

    public function listar(){
        return response()->json([
            'susccess'=>true,
            'data'=>$this->userDomain->listar()
        ]);
    }

    public function login(Request $request){

        $model = new UserModel($request->all());
        $res = $this->userDomain->verifyUserCredentials($model);

        if(!$res){
            return response()->json([
                'success' => false,
                'msg' => 'Invalid email or password'
            ],401);
        }
        Auth::loginUsingId($res->getUserId());
        $accessToken = Auth::user()->createToken('misecretoparaeltoken')->accessToken;
        return response()->json([
            'success' => true,
            "user" =>  $res->toArray(true),
            "access_token" => $accessToken
        ]);

    }

    public function logout(){
        $user = Auth::user()->token();
        $user->revoke();
        return response()->json(array('success'=>true));
    }
}
