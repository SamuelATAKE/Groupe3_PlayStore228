<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\AdminController;
use App\Http\Controllers\CategorieController;
use App\Http\Controllers\ApplicationController;
use App\Http\Controllers\UtilisateurController;
use App\Http\Controllers\TelechargementController;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return view('welcome');
});

Route::get('/administration', [AdminController::class, 'index'])->name('admin.index');

//Route pour les utilisateurs
Route::get('/utilisateurs', [UtilisateurController::class, 'index'])->name('utilisateurs.index');

//Routes pour les applications
Route::get('/applications', [ApplicationController::class, 'index'])->name('applications.index');

//Routes pour les catégories
Route::get('/categories', [CategorieController::class, 'index'])->name('categories.index');
Route::get('/ajouter-categorie', [CategorieController::class, 'create'])->name('categories.create');

//Route pour les téléchargements
Route::get('/telechargements', [TelechargementController::class, 'index'])->name('telechargements.index');
