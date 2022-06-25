import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:shop_app/api_link.dart';
import 'package:shop_app/models/Cart.dart';
import 'package:shop_app/models/Product.dart';

class CartCounter extends ChangeNotifier {
  int counter = 0;

// Obtenir le nombre d'élément du panier
  getCart() async {
    try {
      var response = await Dio().get(panier_api);

      if (response.statusCode == 200) {
        var data = jsonDecode(response.data);

        List<Cart> paniers = [];

        // for (var i in data) {
        //   Cart panier = Cart(
        //       id: i['id'],
        //       product: Product(
        //           id: i['article']['id'],
        //           image: i['article']['photo'],
        //           poids: double.parse("0"),
        //           title: i['article']['libelle'],
        //           marque: i['article']['marque']['libelle'],
        //           categorie: i['article']['souscategorie']['categorie']
        //               ['libelle'],
        //           price: double.parse(i['article']['prix_vente']),
        //           description: i['article']['details']),
        //       numOfItem: int.parse(i['quantite']));

        //   paniers.add(panier);
        // }

        // print(data[0]);

        counter = paniers.length;
      }
    } catch (e) {
      print(e);
    }
  }

  // Suppression du panier

}
