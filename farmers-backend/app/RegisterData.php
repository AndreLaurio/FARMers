<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use DB;

class RegisterData extends Model
{
    public function scopeGetIds(){
        $query = DB::table('valid_id_types')->get();
        return $query;
    }

    public function scopeGetCities(){
        $query = DB::table('cities')->get();
        return $query;
    }
}
