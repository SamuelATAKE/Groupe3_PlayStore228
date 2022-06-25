import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/api_link.dart';
import 'package:shop_app/models/Product.dart';
import 'package:shop_app/screens/product/product_screen.dart';
import 'package:shop_app/size_config.dart';

import '../../components/product_card.dart';

class MoreScreen extends StatelessWidget {
  MoreScreen({Key? key}) : super(key: key);

  static String routeName = "/mores";

  Future getArticle(String type, int id) async {
    String api = product_api;
    if (type == "moreProduct") {
      api = product_api;
    } else if (type == "categorie") {
      api = categories_api + "/" + id.toString();
    } else if (type == "marque") {
      api = marque_api + "/" + id.toString();
    } else {
      api = product_api;
    }
    try {
      var response = await Dio().get(api);

      if (response.statusCode == 200) {
        var data = jsonDecode(response.data);

        List<Product> articles = [];

        // for (var i in data) {
        //   Product product = Product(
        //       id: i['id'],
        //       image: i['photo'],
        //       poids: double.parse(i['poids']),
        //       title: i['libelle'],
        //       marque: i['marque']['libelle'],
        //       categorie: i['souscategorie']['categorie']['libelle'],
        //       price: double.parse(i['prix_vente']),
        //       description: i['details']);

        //   articles.add(product);
        // }

        // print(data[0]['souscategorie']['categorie']);

        return articles;
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    final MoreProductArguments argument =
        ModalRoute.of(context)!.settings.arguments as MoreProductArguments;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Produits disponibles",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: FutureBuilder(
          future: getArticle(argument.type.toString(), argument.id),
          builder: (BuildContext context, snapshot) {
            if (snapshot.data == null) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              var data = (snapshot.data as List<Product>).toList();

              // return Text(data[0].libelle);
              return GridView.count(
                crossAxisCount: 2,
                childAspectRatio: MediaQuery.of(context).size.width /
                    (MediaQuery.of(context).size.height / 1.5),
                children: List.generate(
                  data.length,
                  (index) {
                    return ProductCard(product: data[index]);
                  },
                ),
              );
            }
          }),
    );
  }
}
