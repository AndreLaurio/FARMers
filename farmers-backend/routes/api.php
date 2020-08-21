<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});

Route::get('/getidtypes' , 'RegisterDataController@getId');
Route::get('/getcities' , 'RegisterDataController@getCity');

Route::get('/admin/pending-account', 'AccountController@getPendingAccount');
Route::put('/admin/approve-account/{user_id}', 'AccountController@approveAccount');

Route::get('/article', 'ArticleController@get');
Route::post('/article', 'ArticleController@post');
Route::delete('/article/{id}', 'ArticleController@delete');

Route::get('/news', 'NewsController@get');
Route::post('/news', 'NewsController@post');
Route::delete('/news/{id}', 'NewsController@delete');

Route::get('/products', 'ProductController@get');
Route::post('/product', 'ProductController@post');
Route::get('/products/{user_id}', 'ProductController@getOwnProduct');
Route::delete('/product/{product_id}', 'ProductController@delete');

Route::get('/stocks', 'StockController@getStock');

Route::get('/stock', 'StocksController@get');
Route::post('/stock', 'StockController@post');
Route::get('/stock/measurements', 'StocksController@getMeasurements');
Route::get('/stock/seasons', 'StocksController@getSeasons');
