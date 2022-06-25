import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shop_app/api_link.dart';
import 'package:shop_app/screens/product/categorie_screen.dart';
import 'package:shop_app/screens/product/more_product.dart';
import 'package:shop_app/screens/product/product_screen.dart';
import 'package:dio/dio.dart';
import 'package:shop_app/services/categorie_service.dart';

import '../../../size_config.dart';
import 'section_title.dart';

class SpecialOffers extends StatefulWidget {
  SpecialOffers({Key? key}) : super(key: key);

  @override
  State<SpecialOffers> createState() => _SpecialOffersState();
}

class _SpecialOffersState extends State<SpecialOffers> {
  Categorie categorie1 =
      Categorie(libelle: "Game", id: 1, photo: "assets/images/game.jpeg");
  Categorie categorie2 = Categorie(
      libelle: "Music", id: 1, photo: "assets/images/wireless headset.png");
  Categorie categorie3 = Categorie(
      libelle: "Informatique",
      id: 1,
      photo: "assets/images/serveur-client.png");
  Categorie categorie4 = Categorie(
      libelle: "Commerce", id: 1, photo: "assets/images/splash_2.png");
  Future getCategories() async {
    try {
      List<Categorie> categories = [];

      categories.add(categorie1);
      categories.add(categorie2);
      categories.add(categorie3);
      categories.add(categorie4);

      return categories;
      // var response = await Dio().get(popular_categories_api);

      // if (response.statusCode == 200) {
      //   var data = jsonDecode(response.data);

      //   List<Categorie> categories = [];

      //   for (var i in data) {
      //     Categorie categorie =
      //         Categorie(libelle: i['libelle'], id: i['id'], photo: i['photo']);
      //     categories.add(categorie);
      //   }

      //   // print(data[0]['souscategories'][0]['articles'][0]['marque']);

      //   return categories;
      // }
    } catch (e) {
      print(e);
    }
  }

  // @override
  // void initState() {
  //   getCategories();
  //   print(cat);

  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: SectionTitle(
            title: "Les catégories",
            press: () {
              Navigator.pushNamed(context, CategorieScreen.routeName);
            },
          ),
        ),
        SizedBox(height: getProportionateScreenWidth(20)),
        FutureBuilder(
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
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      ...List.generate(
                        data.length,
                        (index) {
                          return SpecialOfferCard(
                              category: data[index].libelle,
                              image: data[index].photo,
                              press: () {
                                Navigator.pushNamed(
                                    context, MoreScreen.routeName,
                                    arguments: MoreProductArguments(
                                        data[index].id, "categorie"));
                              });
                        },
                      ),
                      SizedBox(width: getProportionateScreenWidth(20)),
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
        // SingleChildScrollView(
        //   scrollDirection: Axis.horizontal,
        //   child: Row(
        //     children: [
        //       SpecialOfferCard(
        //           category: "Categorie 1",
        //           image: "assets/images/game.jpeg",
        //           press: () {
        //             // Navigator.pushNamed(
        //             //     context, MoreScreen.routeName,
        //             //     arguments: MoreProductArguments(
        //             //         data[index].id, "categorie"));
        //           })
        //     ],
        //   ),
        // ),
        SizedBox(width: getProportionateScreenWidth(20)),
      ],
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
      padding: EdgeInsets.only(left: getProportionateScreenWidth(20)),
      child: GestureDetector(
        onTap: press,
        child: Column(
          children: [
            SizedBox(
              width: getProportionateScreenWidth(100),
              height: getProportionateScreenWidth(100),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Stack(
                  children: [
                    Image.asset(
                      image,
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
                    // Padding(
                    //   padding: EdgeInsets.symmetric(
                    //     horizontal: getProportionateScreenWidth(15.0),
                    //     vertical: getProportionateScreenWidth(10),
                    //   ),
                    //   child: Text.rich(
                    //     TextSpan(
                    //       style: const TextStyle(color: Colors.white),
                    //       children: [
                    //         TextSpan(
                    //           text: "$category\n",
                    //           style: TextStyle(
                    //             fontSize: getProportionateScreenWidth(12),
                    //             fontWeight: FontWeight.bold,
                    //           ),
                    //         ),
                    //       ],
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),
            Text(
              category,
              style: TextStyle(color: Colors.black),
              maxLines: 2,
            ),
          ],
        ),
      ),
    );
  }
}
