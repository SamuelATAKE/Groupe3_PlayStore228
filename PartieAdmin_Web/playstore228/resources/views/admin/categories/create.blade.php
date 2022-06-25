@extends('layouts.admin')

<div class="content-wrapper">
    <div class="row">
        <div class="col-md-6 grid-margin stretch-card">
            <div class="card">
              <div class="card-body">
                <h4 class="card-title">Catégorie</h4>
                <p class="card-description">
                  Ajouter catégorie
                </p>
                <form class="forms-sample">
                  <div class="form-group">
                    <label for="exampleInputName1">Nom</label>
                    <input type="text" name="nom" class="form-control" id="exampleInputName1" placeholder="Nom">
                  </div>
                  <div class="form-group">
                    <label for="exampleTextarea1">Description</label>
                    <textarea class="form-control" id="exampleTextarea1" rows="2" name="description"></textarea>
                  </div>
                  <div class="form-group">
                    <label>Ajouter icone</label>
                    <input type="file" name="icone" class="file-upload-default">
                    <div class="input-group col-xs-12">
                      <input type="text" class="form-control file-upload-info" disabled placeholder="Téléverser icone">
                      <span class="input-group-btn">
                        <button class="file-upload-browse btn btn-info" type="button">Téléverser</button>
                      </span>
                    </div>
                  </div>
                  <button type="submit" class="btn btn-success mr-2">Ajouter</button>
                  <button class="btn btn-light">Cancel</button>
                </form>
              </div>
            </div>
          </div>
    </div>
</div>