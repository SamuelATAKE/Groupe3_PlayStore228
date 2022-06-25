@extends('layouts.admin')

@section('content')
    <div class="content-wrapper">
        <div class="row">
            <div class="col-md-4 stretch-card grid-margin">
                <div class="card bg-gradient-warning text-white">
                    <div class="card-body">
                        <h4 class="font-weight-normal mb-3">Nombre d'utilisateurs</h4>
                        <h2 class="font-weight-normal mb-5">{{$nbre_utilisateurs}}</h2>
                        <p class="card-text">Augmentation de 60%</p>
                    </div>
                </div>
            </div>
            <div class="col-md-4 stretch-card grid-margin">
                <div class="card bg-gradient-info text-white">
                    <div class="card-body">
                        <h4 class="font-weight-normal mb-3">Nombre d'applications</h4>
                        <h2 class="font-weight-normal mb-5">{{$nbre_applications}}</h2>
                        <p class="card-text">Diminution de 10%</p>
                    </div>
                </div>
            </div>
            <div class="col-md-4 stretch-card grid-margin">
                <div class="card bg-gradient-success text-white">
                    <div class="card-body">
                        <h4 class="font-weight-normal mb-3">Nombre de téléchargements</h4>
                        <h2 class="font-weight-normal mb-5">{{$nbre_telechargements}}</h2>
                        <p class="card-text">Augmentation 5%</p>
                    </div>
                </div>
            </div>
        </div>
        
    </div>
@endsection
