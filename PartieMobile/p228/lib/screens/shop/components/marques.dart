import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shop_app/api_link.dart';
import 'package:shop_app/components/marque_card.dart';
import 'package:shop_app/screens/product/categorie_screen.dart';
import 'package:shop_app/screens/product/more_product.dart';
import 'package:shop_app/screens/shop/components/marques.dart';
import 'package:dio/dio.dart';
import 'package:shop_app/services/categorie_service.dart';

import '../../../size_config.dart';
import 'section_title.dart';
import 'package:skeletons/skeletons.dart';

class PopularMarque extends StatefulWidget {
  PopularMarque({Key? key}) : super(key: key);

  @override
  State<PopularMarque> createState() => _PopularMarqueState();
}

class _PopularMarqueState extends State<PopularMarque> {
  Future getMarques() async {
    try {
      var response = await Dio().get(popular_marque_api);

      if (response.statusCode == 200) {
        var data = jsonDecode(response.data);

        List<Marque> marques = [];

        for (var i in data) {
          Marque marque = Marque(i['libelle'], i['photo'], i['id']);
          marques.add(marque);
        }

        // print(data[0]['sousmarques'][0]['articles'][0]['marque']);

        return marques;
      }
    } catch (e) {
      print(e);
    }
  }

  // @override
  // void initState() {
  //   getmarques();
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
            title: "Les différentes marques",
            press: () {},
          ),
        ),
        SizedBox(height: getProportionateScreenWidth(20)),
        FutureBuilder(
            future: getMarques(),
            builder: (BuildContext context, snapshot) {
              if (snapshot.data == null) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                var data = (snapshot.data as List<Marque>).toList();

                // return Text(data[0].libelle);
                return SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      ...List.generate(data.length, (index) {
                        return MarqueCard(marque: data[index]);
                      }),
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
        SizedBox(width: getProportionateScreenWidth(20)),
      ],
    );
  }
}
