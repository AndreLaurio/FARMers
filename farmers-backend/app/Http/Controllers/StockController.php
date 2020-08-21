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
}
