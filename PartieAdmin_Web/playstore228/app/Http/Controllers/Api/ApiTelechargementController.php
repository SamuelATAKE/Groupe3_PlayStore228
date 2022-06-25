<?php

namespace App\Http\Controllers;

use App\Models\Telechargement;
use Illuminate\Http\Request;

class ApiTelechargementController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
        $telechargements = Telechargement::All();
        // return view('admin.telechargements.index', compact('telechargements'));
        return json_encode($telechargements);
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
            'application_id' => 'required'
        ]);

        $telechargement = new Telechargement;

        $telechargement->application_id = request('application_id');
        $telechargement->save();

        // return redirect(route(''));
        return json_encode("ok");

    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Telechargement  $telechargement
     * @return \Illuminate\Http\Response
     */
    public function show(Telechargement $telechargement)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Telechargement  $telechargement
     * @return \Illuminate\Http\Response
     */
    public function edit(Telechargement $telechargement)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Telechargement  $telechargement
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Telechargement $telechargement)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Telechargement  $telechargement
     * @return \Illuminate\Http\Response
     */
    public function destroy(Telechargement $telechargement)
    {
        //
    }
}
