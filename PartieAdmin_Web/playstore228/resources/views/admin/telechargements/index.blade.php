@extends('layouts.admin')

@section('content')
    <div class="content-wrapper">
        <div class="row">
            <div class="col-lg-12 stretch-card">
                <div class="card">
                    <div class="card-body">
                        <h4 class="card-title">Téléchargementds</h4>
                        {{-- <p class="card-description">
                            Add class <code>.table-{color}</code>
                        </p> --}}
                        <table class="table table-bordered">
                            <thead>
                                <tr>
                                    <th>
                                        #
                                    </th>
                                    <th>
                                        Application
                                    </th>
                                </tr>
                            </thead>
                            <tbody>
                                @forelse ($telechargements as $telechargement)
                                    <tr class="table-info">
                                        <td>
                                            {{ $telechargement->id }}
                                        </td>
                                        <td>
                                            {{ $telechargement->application->nom }}
                                        </td>
                                    </tr>
                                @empty
                                @endforelse

                                <tr class="table-warning">
                                    <td colspan="5">
                                        Aucun utilisateur n'existe pour le moment
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection
