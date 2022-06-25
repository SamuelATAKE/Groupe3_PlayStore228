import 'package:flutter/material.dart';
import 'package:shop_app/components/rounded_icon_btn.dart';
import 'package:shop_app/models/Product.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class ColorDots extends StatelessWidget {
  ColorDots({Key? key, required this.product}) : super(key: key);

  final Product product;
  int quantite = 1;

  @override
  Widget build(BuildContext context) {
    // Now this is fixed and only for demo
    int selectedColor = 3;
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: Column(
        children: [
          Text(
            "Quantité",
            style: Theme.of(context).textTheme.headline6,
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RoundedIconBtn(
                icon: Icons.remove,
                press: () {},
              ),
              SizedBox(width: getProportionateScreenWidth(20)),
              Text(
                quantite.toString(),
                style: Theme.of(context).textTheme.headline6,
              ),
              SizedBox(width: getProportionateScreenWidth(20)),
              RoundedIconBtn(
                icon: Icons.add,
                showShadow: true,
                press: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }

  void addQuantite() {}

  void removeQuantite() {}
}
