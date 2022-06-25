import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/api_link.dart';
import 'package:shop_app/components/default_button.dart';
import 'package:shop_app/components/rounded_icon_btn.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/providers/cart_provider.dart';
import 'package:shop_app/screens/details/components/top_rounded_container.dart';
import 'package:shop_app/size_config.dart';
import 'package:toast/toast.dart';

import '../../../models/Product.dart';

class QuantiteDefine extends StatefulWidget {
  const QuantiteDefine({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  @override
  State<QuantiteDefine> createState() => _QuantiteDefineState();
}

class _QuantiteDefineState extends State<QuantiteDefine> {
  // add to cart
  void addCart(int quantite, int article) async {
    try {
      var response = await Dio()
          .post(panier_api, data: {'quantite': quantite, 'article': article});
      print(jsonDecode(response.data));

      if (response.statusCode == 200) {
        if (jsonDecode(response.data).toString() == "success") {
          // Stocker la valeur
          showDialog<String>(
            context: context,
            builder: (BuildContext context) => AlertDialog(
              title: const Text('Produit ajouté'),
              content: const Icon(
                Icons.check_circle,
                color: Colors.green,
                size: 80.0,
              ),
              actions: <Widget>[
                TextButton(
                  onPressed: () => Navigator.pop(context, 'OkK'),
                  child: const Text('OK'),
                ),
              ],
            ),
          );
        }
      } else {
        print(response.statusCode);
      }
    } catch (e) {
      print(e);
    }
  }

  // Quantité
  int quantite = 1;
  void addQuantite() {
    setState(() {
      quantite += 1;
    });
  }

  void removeQuantite() {
    if (quantite >= 2) {
      setState(() {
        quantite -= 1;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: Column(
        children: [
          TopRoundedContainer(
            color: Colors.white,
            child: Padding(
              padding: EdgeInsets.only(
                left: SizeConfig.screenWidth * 0.15,
                right: SizeConfig.screenWidth * 0.15,
                bottom: getProportionateScreenWidth(40),
                top: getProportionateScreenWidth(15),
              ),
              child: DefaultButton(
                text: "Installer",
                press: () {
                  addCart(quantite, widget.product.id);
                  Provider.of<CartProvider>(context, listen: false)
                      .counterCart();
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
