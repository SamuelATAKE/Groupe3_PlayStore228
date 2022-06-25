import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/api_link.dart';
import 'package:shop_app/screens/product/more_product.dart';
import 'package:shop_app/screens/product/product_screen.dart';
import 'package:shop_app/services/categorie_service.dart';
import 'package:shop_app/size_config.dart';

class CategorieScreen extends StatelessWidget {
  const CategorieScreen({Key? key}) : super(key: key);

  static String routeName = "/categories";

  Future getCategories() async {
    try {
      var response = await Dio().get(categories_api);

      if (response.statusCode == 200) {
        var data = jsonDecode(response.data);

        List<Categorie> categories = [];

        for (var i in data) {
          Categorie categorie =
              Categorie(libelle: i['libelle'], id: i['id'], photo: i['photo']);
          categories.add(categorie);
        }

        // print(data[0]['souscategories'][0]['articles'][0]['marque']);

        return categories;
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Les catégories",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: FutureBuilder(
          future: getCategories(),
          builder: (BuildContext context, snapshot) {
            if (snapshot.data == null) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              var data = (snapshot.data as List<Categorie>).toList();

              // return Text(data[0].libelle);
              return SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    ...List.generate(
                      data.length,
                      (index) {
                        return SpecialOfferCard(
                            category: data[index].libelle,
                            image: data[index].photo,
                            press: () {
                              Navigator.pushNamed(context, MoreScreen.routeName,
                                  arguments: MoreProductArguments(
                                      data[index].id, "categorie"));
                            });
                      },
                    ),
                  ],
                ),

                // child: ListView.builder(
                //   itemCount: data.length,
                //   itemBuilder: (context, index) {
                //     return Text(data[index].libelle);
                //   },
                // ),
              );
            }
          }),
    );
  }
}

class SpecialOfferCard extends StatelessWidget {
  const SpecialOfferCard({
    Key? key,
    required this.category,
    required this.image,
    required this.press,
  }) : super(key: key);

  final String category, image;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(getProportionateScreenWidth(10)),
      child: GestureDetector(
        onTap: press,
        child: SizedBox(
          width: getProportionateScreenWidth(350),
          height: getProportionateScreenWidth(150),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Stack(
              children: [
                Image.network(
                  categorie_asset + image,
                  fit: BoxFit.cover,
                ),
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        const Color(0xFF343434).withOpacity(0.4),
                        const Color(0xFF343434).withOpacity(0.15),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(15.0),
                    vertical: getProportionateScreenWidth(10),
                  ),
                  child: Text.rich(
                    TextSpan(
                      style: const TextStyle(color: Colors.white),
                      children: [
                        TextSpan(
                          text: "$category\n",
                          style: TextStyle(
                            fontSize: getProportionateScreenWidth(18),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
