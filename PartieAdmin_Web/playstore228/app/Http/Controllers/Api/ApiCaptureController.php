<?php

namespace App\Http\Controllers;

use Psy\Util\Str;
use App\Models\Capture;
use Faker\Provider\Image;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class ApiCaptureController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
        $captures = Capture::All();
        return json_encode($captures);
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
        $capture = new Capture;

        if(request('capture1')){
            $path1 = $request->capture1->store("applications/captures", 'public');

            $logo1 = Image::make('storage/'.$path1);

            $randString = Str::random(30);
            $logo_name1 = 'applications/captures/'.$randString.'_'.time().'.png';
            $logo1->save('storage/'.$logo_name1);
        }else  if(request('capture2')){
            $path2 = $request->capture2->store("applications/captures", 'public');

            $logo2 = Image::make('storage/'.$path2);

            $randString = Str::random(30);
            $logo_name2 = 'applications/captures/'.$randString.'_'.time().'.png';
            $logo2->save('storage/'.$logo_name2);
        }else  if(request('capture3')){
            $path3 = $request->capture3->store("applications/captures", 'public');

            $logo3 = Image::make('storage/'.$path3);

            $randString = Str::random(30);
            $logo_name3 = 'applications/captures/'.$randString.'_'.time().'.png';
            $logo3->save('storage/'.$logo_name3);
        }else  if(request('capture4')){
            $path4 = $request->capture4->store("applications/captures", 'public');

            $logo4 = Image::make('storage/'.$path4);

            $randString = Str::random(30);
            $logo_name4 = 'applications/captures/'.$randString.'_'.time().'.png';
            $logo4->save('storage/'.$logo_name4);
        }else  if(request('capture5')){
            $path5 = $request->capture5->store("applications/captures", 'public');

            $logo5 = Image::make('storage/'.$path5);

            $randString = Str::random(30);
            $logo_name5 = 'applications/captures/'.$randString.'_'.time().'.png';
            $logo5->save('storage/'.$logo_name5);
        }else  if(request('capture6')){
            $path6 = $request->capture6->store("applications/captures", 'public');

            $logo6 = Image::make('storage/'.$path6);

            $randString = Str::random(30);
            $logo_name6 = 'applications/captures/'.$randString.'_'.time().'.png';
            $logo6->save('storage/'.$logo_name6);
        }else  if(request('capture7')){
            $path7 = $request->capture7->store("applications/captures", 'public');

            $logo7 = Image::make('storage/'.$path7);

            $randString = Str::random(30);
            $logo_name7 = 'applications/captures/'.$randString.'_'.time().'.png';
            $logo7->save('storage/'.$logo_name7);
        }else  if(request('capture8')){
            $path8 = $request->capture8->store("applications/captures", 'public');

            $logo8 = Image::make('storage/'.$path8);

            $randString = Str::random(30);
            $logo_name8 = 'applications/captures/'.$randString.'_'.time().'.png';
            $logo8->save('storage/'.$logo_name8);
        }

        $capture->application_id = request('utilisateur_id');
        $capture->save();

        // return redirect(route(''));
        return json_encode("ok");

    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Capture  $capture
     * @return \Illuminate\Http\Response
     */
    public function show(Capture $capture)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Capture  $capture
     * @return \Illuminate\Http\Response
     */
    public function edit(Capture $capture)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Capture  $capture
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Capture $capture)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Capture  $capture
     * @return \Illuminate\Http\Response
     */
    public function destroy(Capture $capture)
    {
        //
    }
}
