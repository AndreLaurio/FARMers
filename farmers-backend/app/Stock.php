<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use DB;

class Stock extends Model
{
    public function scopeGetStocks(){
        $query = DB::table('stocks as s')
        ->leftJoin('measurements as m', 's.measurement_id', 'm.measurement_id')
        ->leftJoin('seasons as ss', 's.season_id', 'ss.season_id')
        ->get();

        return $query;
    }
}
