import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shop_app/api_link.dart';
import 'package:shop_app/components/default_button.dart';
import 'package:shop_app/models/Cart.dart';
import 'package:shop_app/models/Product.dart';
import 'package:skeletons/skeletons.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class CheckoutCard extends StatelessWidget {
  const CheckoutCard({
    Key? key,
  }) : super(key: key);

  Future getCartPrice() async {
    try {
      var response = await Dio().get(panier_api);

      if (response.statusCode == 200) {
        var data = jsonDecode(response.data);

        List<double> paniers = [];

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

        //   paniers.add(panier.product.price * panier.numOfItem);
        // }

        double total = 0;
        for (var price in paniers) {
          total += price;
        }

        return total;
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: getProportionateScreenWidth(15),
        horizontal: getProportionateScreenWidth(30),
      ),
      // height: 174,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, -15),
            blurRadius: 20,
            color: Color(0xFFDADADA).withOpacity(0.15),
          )
        ],
      ),
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: getProportionateScreenHeight(20)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: getProportionateScreenWidth(190),
                  child: DefaultButton(
                    text: "Installer",
                    press: () {
                      getCartPrice();
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
