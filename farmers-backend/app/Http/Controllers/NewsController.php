<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\News;

class NewsController extends Controller
{
    public function get(){
        return response()->json(News::get());

    }

    public function delete($id){
        return response()->json(News::destroy($id));
    }

    public function put(Request $request, $id){
        $new = News::find($id);
        $new->save();

        return response()->json($new);

    }

    public function post(Request $request){
        $new = new News();
        $new->author_id = $request->input('user_id');
        $new->title =  $request->input('title');
        $new->body = $request->input('body');
        $new->save();

        return response()->json($new);
    }
}
