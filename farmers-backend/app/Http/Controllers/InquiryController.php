<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Inquiry;

class InquiryController extends Controller
{
    public function get(Request $request, $product_id){
        $inquries = Inquiry::getInquiries($product_id);
        return response()->json($inquries);
    }

    public function post(Request $request){
        $inquiries = new Inquiry();
        $inquiries->product_id = $request->input('product_id');
        $inquiries->seller_id = $request->input('seller_id');
        $inquiries->buyer_id = $request->input('buyer_id');
        $inquiries->save();
    }
}
