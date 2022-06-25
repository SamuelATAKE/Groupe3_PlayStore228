@extends('layouts.admin')

@section('content')
    <div class="content-wrapper">
        <div class="row">
            <div class="col-lg-12 stretch-card">
                <div class="card">
                    <div class="card-body">
                        <h4 class="card-title">Catégories</h4>
                       <a href="{{route('categories.create')}}"><p class="card-description">Ajouter catégorie</p></a> 
                        <table class="table table-bordered">
                            <thead>
                                <tr>
                                    <th>
                                        #
                                    </th>
                                    <th>
                                        Icone
                                    </th>
                                    <th>
                                        Nom
                                    </th>
                                </tr>
                            </thead>
                            <tbody>
                                @forelse ($categories as $categorie)
                                    <tr class="table-info">
                                        <td>
                                            {{ $categorie->id }}
                                        </td>
                                        <td>
                                            <img src="{{ $categorie->icone }}" />
                                        </td>
                                        <td>
                                            {{ $categorie->nom }}
                                        </td>
                                    </tr>
                                @empty
                                    <tr class="table-warning">
                                        <td colspan="5">
                                            Aucune catégorie n'existe pour le moment
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
