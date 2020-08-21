<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use DB;

class StocksController extends Controller
{
    public function get(){
        $query = DB::select(DB::raw(
                'SELECT CONCAT(
                    DATE_FORMAT(s.date_start, "%M %Y"),
                    "-",
                    DATE_FORMAT(s.date_end, "%M %Y")
                  ) AS month,
                  se.season,
                  CONCAT(s.value_start, " - ", s.value_end) AS value,
                  LOWER(CONCAT(s.value_start, " - ", s.value_end, " per ", me.measurement)) AS value_with_measurement
                 FROM stocks AS s
                 LEFT JOIN seasons AS se ON se.season_id = s.season_id
                 LEFT JOIN measurements AS me ON me.measurement_id = s.measurement_id
                 ORDER BY s.date_start ASC
                '));

        return $query;
    }
}
