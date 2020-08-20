<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\RegisterData;

class RegisterDataController extends Controller
{
    public function getId(){
        $ids = RegisterData::getIds();
        return response()->json($ids);
    }

    public function getCity(){
        $cities = RegisterData::getCities();
        return response()->json($cities);
    }
}
