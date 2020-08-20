<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Product;

class ProductController extends Controller
{
    public function post(Request $request){
        $product = new Product();
        $product->seller_id = $request->input('seller_id');
        $product->product_name =  $request->input('product_name');
        $product->description = $request->input('description');
        $product->save();

        return response()->json($product);
    }
}
