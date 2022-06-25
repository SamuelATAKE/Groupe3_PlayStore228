<?php

namespace App\Http\Controllers;

use App\Models\Favoris;
use Illuminate\Http\Request;

class ApiFavorisController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
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
            'utilisateur_id' => 'required',
            'application_id' => 'required'
        ]);

        $favoris = new Favoris;

        $favoris->utilisateur_id = required('utilisateur_id');
        $favoris->application_id = required('application_id');
        $favoris->save();

        // return back();
        return json_encode("ok");

    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Favoris  $favoris
     * @return \Illuminate\Http\Response
     */
    public function show(Favoris $favoris)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Favoris  $favoris
     * @return \Illuminate\Http\Response
     */
    public function edit(Favoris $favoris)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Favoris  $favoris
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Favoris $favoris)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Favoris  $favoris
     * @return \Illuminate\Http\Response
     */
    public function destroy(Favoris $favoris)
    {
        //
    }
}
