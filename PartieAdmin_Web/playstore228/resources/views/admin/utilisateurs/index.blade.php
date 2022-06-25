@extends('layouts.admin')

@section('content')
    <div class="content-wrapper">
        <div class="row">
            <div class="col-lg-12 stretch-card">
                <div class="card">
                    <div class="card-body">
                        <h4 class="card-title">Utilisateurs</h4>
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
                                        Nom & prénoms
                                    </th>
                                    <th>
                                        Email
                                    </th>
                                    <th>
                                        Telephone
                                    </th>
                                    <th>
                                        Role
                                    </th>
                                </tr>
                            </thead>
                            <tbody>
                                @forelse ($utilisateurs as $utilisateur)
                                    <tr class="table-info">
                                        <td>
                                            {{ $utilisateur->id }}
                                        </td>
                                        <td>
                                            {{ $utilisateur->nom }} {{ $utilisateur->prenom }}
                                        </td>
                                        <td>
                                            {{ $utilisateur->email }}
                                        </td>
                                        <td>
                                            {{ $utilisateur->telephone }}
                                        </td>
                                        <td>
                                            {{ $utilisateur->Role }}
                                        </td>
                                    </tr>
                                @empty
                                    <tr class="table-warning">
                                        <td colspan="5">
                                            Aucun utilisateur n'existe pour le moment
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
