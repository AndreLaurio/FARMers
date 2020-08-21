<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Product;
use Illuminate\Support\Facades\Log;

class ProductController extends Controller
{

    public function post(Request $request){
        $product = new Product();

        $product->seller_id = $request->input('seller_id');
        $product->product_name =  $request->input('product_name');
        $product->description = $request->input('description');

        $product->product_img_path = time().'.'.$request->file('product_img')->getClientOriginalExtension();
        $request->file('product_img')->move(public_path('images/products'), $product->product_img_path);

        $product->save();

        return response()->json($product);
    }
}
