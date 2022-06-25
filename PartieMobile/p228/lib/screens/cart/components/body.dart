import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/api_link.dart';
import 'package:shop_app/models/Cart.dart';
import 'package:shop_app/models/Product.dart';
import 'package:shop_app/providers/cart_provider.dart';
import 'package:skeletons/skeletons.dart';

import '../../../size_config.dart';
import 'cart_card.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  Cart panier1 = Cart(id: 1, product: produit1);
  Cart panier2 = Cart(id: 2, product: produit2);
  Cart panier3 = Cart(id: 3, product: produit3);
  Cart panier4 = Cart(id: 4, product: produit4);
  Future getCart() async {
    try {
      List<Cart> paniers = [];
      paniers.add(panier1);
      paniers.add(panier2);
      paniers.add(panier3);
      paniers.add(panier4);
      // var response = await Dio().get(panier_api);

      // if (response.statusCode == 200) {
      //   var data = jsonDecode(response.data);

      //   List<Cart> paniers = [];

      //   for (var i in data) {
      //     Cart panier = Cart(
      //         id: i['id'],
      //         product: Product(
      //             id: i['article']['id'],
      //             image: i['article']['photo'],
      //             poids: double.parse(i['article']['poids']),
      //             title: i['article']['libelle'],
      //             marque: i['article']['marque']['libelle'],
      //             categorie: i['article']['souscategorie']['categorie']
      //                 ['libelle'],
      //             price: double.parse(i['article']['prix_vente']),
      //             description: i['article']['details']),
      //         numOfItem: int.parse(i['quantite']));

      //     paniers.add(panier);
      //   }

      //   // print(data[0]);

      //   return paniers;
      // }
      return paniers;
    } catch (e) {
      print(e);
    }
  }

  // Supression du panier
  void deleteCart(int cart) async {
    try {
      var response = await Dio().put(panier_delete_api + cart.toString());
      print(panier_delete_api + cart.toString());

      if (response.statusCode == 200) {
        if (jsonDecode(response.data).toString() == "success") {
          // Stocker la valeur
          print('okk');
        }
      } else {
        print(response.headers);
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: FutureBuilder(
          future: getCart(),
          builder: (BuildContext context, snapshot) {
            if (snapshot.data == null) {
              return Center(
                  child: SingleChildScrollView(
                child: SkeletonParagraph(
                  style: SkeletonParagraphStyle(
                      lines: 50,
                      spacing: 6,
                      lineStyle: SkeletonLineStyle(
                        randomLength: true,
                        height: 10,
                        borderRadius: BorderRadius.circular(8),
                        minLength: MediaQuery.of(context).size.width / 6,
                        maxLength: MediaQuery.of(context).size.width / 3,
                      )),
                ),
              ));
            } else {
              var data = (snapshot.data as List<Cart>).toList();

              // return Text(data[0].libelle);
              return ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, index) => Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Dismissible(
                    key: Key(data[index].product.id.toString()),
                    direction: DismissDirection.endToStart,
                    onDismissed: (direction) {},
                    background: Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(
                        color: Color(0xFFFFE6E6),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Row(
                        children: [
                          Spacer(),
                          SvgPicture.asset("assets/icons/Trash.svg"),
                        ],
                      ),
                    ),
                    child: CartCard(cart: data[index]),
                  ),
                ),
              );
            }
          }),
    );
  }
}
