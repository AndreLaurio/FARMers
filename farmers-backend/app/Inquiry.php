<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use DB;

class Inquiry extends Model
{
    protected $table = 'inquiry';
    protected $primaryKey = 'inquiry_id';

    public function scopeGetInquiries($query,$product_id){
        // $test = (int)$product_id;
        $query = DB::table('users as u')
        ->leftJoin('inquiry as i','u.user_id', 'i.buyer_id')
        ->where('i.product_id',$product_id)
        ->select('u.first_name', 'u.last_name', 'i.created_at')
        ->get();
        return $query;
    }
}
