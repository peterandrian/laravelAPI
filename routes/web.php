<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\DroneController;

Route::get('/', function () {
    return view('pages.home');
})->name('home');

Route::get('/drone', function () {
    return view('pages.plp');
})->name('plp');

Route::get('/drone/{i}', function () {
    return view('pages.pdp');
})->name('pdp');
