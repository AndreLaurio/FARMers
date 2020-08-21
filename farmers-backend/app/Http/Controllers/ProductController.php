<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Product;

class ProductController extends Controller
{
    public function get(){
        return response()->json(Product::get());
    }

    public function getOwnProduct(Request $request, $user_id){
        $ownProduct = Product::where('seller_id',$user_id)->get();
        return response()->json($ownProduct);
    }

    public function delete($product_id){
        return response()->json(Product::destroy($product_id));
    }

    public function post(Request $request){
        $product = new Product();

        $product->seller_id = $request->input('seller_id');
        $product->product_name =  $request->input('product_name');
        $product->description = $request->input('description');
        $product->price = $request->input('price');
        $product->total_stocks = $request->input('total_stocks');
        $product->rem_stocks = $request->input('total_stocks');
        $product->min_buyable_stocks = $request->input('min_buyable_stocks');

        $product->product_img_path = time().'.'.$request->file('product_img')->getClientOriginalExtension();
        $request->file('product_img')->move(public_path('../../farmers-frontend/src/assets/storage/images/products'), $product->product_img_path);

        $product->save();

        return response()->json($product);
    }
}
