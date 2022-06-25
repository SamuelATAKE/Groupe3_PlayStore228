<?php

namespace App\Http\Controllers;

use App\Models\Utilisateur;
use Illuminate\Http\Request;

class UtilisateurController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
        $utilisateurs = Utilisateur::All();
        return view('admin.utilisateurs.index', compact('utilisateurs'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
        return view('auth.register');
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
            'prenom' => 'required',
            'email' => 'required',
            'telephone' => 'required',
            'username' => 'required',
            'password' => 'required'
        ]);

        $utilisateur = new Utilisateur;

        $utilisateur->nom = request('nom');
        $utilisateur->prenom = request('prenom');
        $utilisateur->email = request('email');
        $utilisateur->telephone = request('telephone');
        $utilisateur->username = request('username');
        $utilisateur->password = request('password');
        $utilisateur->role = 'user';
        $utilisateur->save();

        return redirect(route(''));
    }

    public function login(){
        request()->validate([
            'email' => 'required',
            'password' => 'required'
        ]);

        $utilisateur = Utilisateur::where('email', request('email'))->where('password', request('password'))->first();

        if($utilisateur){
            session([
                'utilisateur' => $utilisateur
            ]);

            return redirect(route(''));
        }else{
            return back();
        }
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Utilisateur  $utilisateur
     * @return \Illuminate\Http\Response
     */
    public function show(Utilisateur $utilisateur)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Utilisateur  $utilisateur
     * @return \Illuminate\Http\Response
     */
    public function edit(Utilisateur $utilisateur)
    {
        //
        return view('utilisateurs.edit', compact('utilisateur'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Utilisateur  $utilisateur
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Utilisateur $utilisateur)
    {
        //
        request()->validate([
            'nom' => 'required',
            'prenom' => 'required',
            'email' => 'required',
            'telephone' => 'required',
            'username' => 'required'
        ]);

        $utilisateur->nom = request('nom');
        $utilisateur->prenom = request('prenom');
        $utilisateur->email = request('email');
        $utilisateur->telephone = request('telephone');
        $utilisateur->username = request('username');
        $utilisateur->role = 'user';
        $utilisateur->save();

        return redirect(route(''));
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Utilisateur  $utilisateur
     * @return \Illuminate\Http\Response
     */
    public function destroy(Utilisateur $utilisateur)
    {
        //
    }
}
