<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use DB;
use App\Measurement;
use App\Season;

class StocksController extends Controller
{
    public function get(){
        $query = DB::select(DB::raw(
                'SELECT 
                    CASE
                        WHEN MONTH(s.date_start) = MONTH(s.date_end) AND YEAR(s.date_start) = YEAR(s.date_end)
                        THEN DATE_FORMAT(s.date_start, "%M %Y")
                        ELSE 
                        CONCAT(
                            DATE_FORMAT(s.date_start, "%M %Y"),
                            " - ",
                            DATE_FORMAT(s.date_end, "%M %Y")
                        ) 
                    END AS month,

                    se.season,

                    CASE 
                        WHEN s.value_start = s.value_end
                        THEN LOWER(CONCAT(s.value_start, " per ", me.measurement)) 
                        ELSE LOWER(CONCAT(s.value_start, " - ", s.value_end, " per ", me.measurement))
                    END AS value_with_measurement
                FROM stocks AS s
                LEFT JOIN seasons AS se ON se.season_id = s.season_id
                LEFT JOIN measurements AS me ON me.measurement_id = s.measurement_id
                ORDER BY s.date_start ASC
                '));

        return $query;
    }

    public function getMeasurements(){
        
        return response()->json(Measurement::get());
    }

    public function getSeasons(){
        
        return response()->json(Season::get());
    }
}
