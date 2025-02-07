<?php

use App\Models\Car;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

Route::get('/cars', function (Request $request) {
    $brand = $request->query('brand');
    return response()->json(Car::where('brand', $brand)->get());
});

Route::prefix('api')->group(function () {
    Route::get('/brands', function () {
        return response()->json(Car::distinct()->pluck('brand')->sort()->values());
    });
});

Route::get('/{any}', function () {
    return view('welcome');
})->where('any', '^(?!api).*$'); 
