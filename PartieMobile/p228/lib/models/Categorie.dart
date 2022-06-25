import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shop_app/api_link.dart';

import 'Product.dart';
import 'Product.dart';

import 'package:dio/dio.dart';

class Categorie {
  final String libelle;
  final int id;
  final String photo;

  Categorie({required this.id, required this.libelle, required this.photo});
}

// Demo data for our Categorie

List<Categorie> Categories = [
  Categorie(
      libelle: "Beauté",
      id: 2,
      photo:
          "https://cdn.pixabay.com/photo/2016/11/22/23/40/hands-1851218__340.jpg"),
];

void getCategories() async {
  try {
    var response = await Dio().get(categories_api);

    if (response.statusCode == 200) {
      final res = jsonDecode(response.data);
      for (var i = 0; i < res.length; i++) {
        Categorie(
            libelle: res[i]['libelle'],
            id: res[i]['id'],
            photo: res[i]['photo']);
      }
    } else {
      print(response.statusCode);
    }
  } catch (e) {
    print(e);
  }
}
