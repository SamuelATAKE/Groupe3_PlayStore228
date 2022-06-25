<?php

namespace App\Http\Controllers;

use App\Models\Publicite;
use Illuminate\Http\Request;

class PubliciteController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
        $publicites = Publicite::All();
        return view('admin.publicites.index', compact('publicites'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //
        request()->validate([
            'nom' => 'required',
            'description' => 'required',
            'poster' => 'required',
            'application_id' => 'required'
        ]);

        $path = $request->poster->store("publicites/poster", 'public');

        $poster = Image::make('storage/'.$path);
        $randString = Str::random(30);
        $pster_name = 'publicites/poster/'.$randString.'_'.time().'.png';
        $poster->save('storage/'.$poster_name);

        $publicite = new Publicite;

        $publicite->nom = request('nom');
        $publicite->description = request('description');
        $publicite->poster = $poster;
        $publicite = request('utilisateur_id');
        $publicite->save();

        return redirect(route(''));
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Publicite  $publicite
     * @return \Illuminate\Http\Response
     */
    public function show(Publicite $publicite)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Publicite  $publicite
     * @return \Illuminate\Http\Response
     */
    public function edit(Publicite $publicite)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Publicite  $publicite
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Publicite $publicite)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Publicite  $publicite
     * @return \Illuminate\Http\Response
     */
    public function destroy(Publicite $publicite)
    {
        //
    }
}
