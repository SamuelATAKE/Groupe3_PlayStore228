@extends('layouts.admin')

@section('content')
    <div class="content-wrapper">
        <div class="row">
            <div class="col-lg-12 stretch-card">
                <div class="card">
                    <div class="card-body">
                        <h4 class="card-title">Applications</h4>
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
                                        Logo
                                    </th>
                                    <th>
                                        Nom
                                    </th>
                                    <th>
                                        Version d'Apk
                                    </th>
                                    <th>
                                        Version Android
                                    </th>
                                    <th>
                                        Note
                                    </th>
                                    <th>Fichier Apk</th>
                                </tr>
                            </thead>
                            <tbody>
                                @forelse ($applications as $application)
                                    <tr class="table-info">
                                        <td>
                                            {{ $application->id }}
                                        </td>
                                        <td>
                                            <img src="{{ $application->logo }}" />
                                        </td>
                                        <td>
                                            {{ $application->nom }}
                                        </td>
                                        <td>
                                            {{ $application->versionApk }}
                                        </td>
                                        <td>
                                            {{ $application->versionAndroid }}
                                        </td>
                                        <td>
                                            {{ $application->note }}
                                        </td>
                                        <td><a href="{{ $application->fileApk }}">Télécharger</a></td>
                                    </tr>
                                @empty
                                    <tr class="table-warning">
                                        <td colspan="7">
                                            Aucune application n'existe pour le moment
                                        </td>
                                    </tr>
                                @endforelse


                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection
