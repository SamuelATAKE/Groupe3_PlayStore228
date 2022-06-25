import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shop_app/api_link.dart';
import 'package:shop_app/components/product_card.dart';
import 'package:shop_app/models/Product.dart';
import 'package:shop_app/screens/product/more_product.dart';
import 'package:shop_app/screens/product/product_screen.dart';

import '../../../services/categorie_service.dart';
import '../../../size_config.dart';
import 'section_title.dart';
import 'package:skeletons/skeletons.dart';

class PopularProducts extends StatelessWidget {
  final localStore = GetStorage();

  Future getArticle() async {
    try {
      List<Product> articles = [];
      articles.add(produit1);
      articles.add(produit2);
      articles.add(produit3);
      articles.add(produit4);
      // var response = await Dio().get(popular_product_api);

      // if (response.statusCode == 200) {
      //   var data = jsonDecode(response.data);

      //   List<Product> articles = [];

      //   for (var i in data) {
      //     Product product = Product(
      //         id: i['id'],
      //         image: i['photo'],
      //         title: i['libelle'],
      //         categorie: i['souscategorie']['categorie']['libelle'],
      //         description: i['details']);

      //     articles.add(product);
      //   }

      //   // print(data[0]['souscategorie']['categorie']);
      //   // localStore.write('produits', articles);

      //   return articles;
      // }
      return articles;
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: SectionTitle(
              title: "Applications populaires",
              press: () {
                Navigator.pushNamed(context, MoreScreen.routeName,
                    arguments: MoreProductArguments(0, "moreProduct"));
                // getArticle();
              }),
        ),
        SizedBox(height: getProportionateScreenWidth(20)),
        FutureBuilder(
            future: getArticle(),
            builder: (BuildContext context, snapshot) {
              if (snapshot.data == null) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                var data = (snapshot.data as List<Product>).toList();

                // return Text(data[0].libelle);
                return SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      ...List.generate(
                        data.length,
                        (index) {
                          return ProductCard(product: data[index]);
                        },
                      ),
                      SizedBox(width: getProportionateScreenWidth(20)),
                    ],
                  ),
                );
              }
            }),

        // SingleChildScrollView(
        //   scrollDirection: Axis.horizontal,
        //   child: Row(
        //     children: [ProductCard(product: produit1)],
        //   ),
        // )
      ],
    );
  }
}
