<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Article;

class ArticleController extends Controller
{
    public function get(){
        return response()->json(Article::get());

    }

    public function delete($id){
        return response()->json(Article::destroy($id));
    }

    public function put(Request $request, $id){
        $article = Article::find($id);
        $article->save();

        return response()->json($article);

    }

    public function post(Request $request){
        $article = new Article();
        $article->author_id = $request->input('user_id');
        $article->title =  $request->input('title');
        $article->body = $request->input('body');
        $article->save();

        return response()->json($article);
    }

}
