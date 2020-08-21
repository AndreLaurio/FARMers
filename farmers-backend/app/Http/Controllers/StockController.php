<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Stock;

class StockController extends Controller
{
    public function getStock(){
        $stocks = Stock::getStocks();
        return response()->json($stocks);
    }

    public function post(Request $request) {
        $stock = new Stock();

        $stock->product_name = $request->input('product_name');
        $stock->measurement_id = $request->input('measurement_id');
        $stock->season_id = $request->input('season_id');
        $stock->date_start = $request->input('date_start');
        $stock->date_end = $request->input('date_end');
        $stock->value_start = $request->input('value_start');
        $stock->value_end = $request->input('value_end');
        $stock->inserted_by = $request->input('inserted_by');
        $stock->updated_by = $request->input('inserted_by');

        $stock->save();

        return response()->json($stock);
    }
}
