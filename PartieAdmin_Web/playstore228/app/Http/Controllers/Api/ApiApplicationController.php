<?php

namespace App\Http\Controllers;

use App\Models\Application;
use Illuminate\Http\Request;

class ApiApplicationController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
        $applications = Application::All();

        // return view('admin.applications.index', compact('applications'));
        return json_encode($applications);
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
            'logo' => 'required',
            'capture_id' => 'required',
            'guide' => 'required',
            'description' => 'required',
            'condition' => 'required',
            'fileApk' => 'required',
            'packageName' => 'required',
            'versionApk' => 'required',
            'versionAndroid' => 'required',
            'categorie_id' => 'required',
            'utilisateur_id' => 'required'
        ]);

        $path = $request->logo->store("applications/logo", 'public');

        $logo = Image::make('storage/'.$path);

        $randString = Str::random(30);
        $logo_name = 'applications/logo/'.$randString.'_'.time().'.png';
        $logo->save('storage/'.$logo_name);

        $application = new Application;

        $application->nom = request('nom');
        $application->logo = request('logo');
        $application->capture_id = request('capture_id');
        $application->guide = request('guide');
        $application->description = request('description');
        $application->condition = request('condition');
        $application->fileApk = request('fileApk');
        $application->packageName = request('packageName');
        $application->versionApk = request('versionApk');
        $application->versionAndroid = request('versionAndroid');
        $application->categorie_id = request('categorie_id');
        $application->utilisateur_id = request('utilisateur_id');
        $application->save();

        // return redirect(route(''));
        return json_encode("ok");

    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Application  $application
     * @return \Illuminate\Http\Response
     */
    public function show(Application $application)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Application  $application
     * @return \Illuminate\Http\Response
     */
    public function edit(Application $application)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Application  $application
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Application $application)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Application  $application
     * @return \Illuminate\Http\Response
     */
    public function destroy(Application $application)
    {
        //
    }
}
