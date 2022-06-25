import 'package:flutter/material.dart';
import 'package:shop_app/api_link.dart';
import 'package:shop_app/screens/product/more_product.dart';
import 'package:shop_app/screens/product/product_screen.dart';
import 'package:shop_app/services/categorie_service.dart';

import '../constants.dart';
import '../size_config.dart';

class MarqueCard extends StatelessWidget {
  const MarqueCard({
    Key? key,
    this.width = 140,
    this.aspectRetio = 1.02,
    required this.marque,
  }) : super(key: key);

  final double width, aspectRetio;
  final Marque marque;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: getProportionateScreenWidth(20)),
      child: SizedBox(
        width: getProportionateScreenWidth(width),
        child: GestureDetector(
          onTap: () => {
            Navigator.pushNamed(context, MoreScreen.routeName,
                arguments: MoreProductArguments(marque.id, "marque"))
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AspectRatio(
                aspectRatio: 1.02,
                child: Container(
                  padding: EdgeInsets.all(getProportionateScreenWidth(20)),
                  decoration: BoxDecoration(
                    color: kSecondaryColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Hero(
                    tag: marque.id.toString(),
                    child: Image.network(marque_asset + marque.photo),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                marque.libelle,
                style: TextStyle(color: Colors.black),
                maxLines: 2,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
