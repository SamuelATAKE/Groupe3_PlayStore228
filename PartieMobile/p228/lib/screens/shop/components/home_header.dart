import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/api_link.dart';
import 'package:shop_app/models/Cart.dart';
import 'package:shop_app/models/Product.dart';
import 'package:shop_app/providers/cart_provider.dart';
import 'package:shop_app/screens/cart/cart_screen.dart';
import 'package:shop_app/screens/profile/profile_screen.dart';
import 'package:shop_app/screens/sign_up/sign_up_screen.dart';

import '../../../size_config.dart';
import 'icon_btn_with_counter.dart';
import 'search_field.dart';

class HomeHeader extends StatefulWidget {
  HomeHeader({Key? key}) : super(key: key);

  @override
  State<HomeHeader> createState() => _HomeHeaderState();
}

class _HomeHeaderState extends State<HomeHeader> {
  final localstore = GetStorage();

  String _userIcon() {
    if (localstore.read('email') == null) {
      return "assets/icons/User Icon.svg";
    } else {
      return "assets/icons/user_login.svg";
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    _userIcon();
    print(localstore.read("email"));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<CartProvider>(context, listen: false).counterCart();
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SearchField(),

          // return Text(data[0].libelle);
          Consumer<CartProvider>(builder: (context, CartProvider, child) {
            return IconBtnWithCounter(
              svgSrc: "assets/icons/Heart Icon_2.svg",
              numOfitem: CartProvider.counter,
              press: () => Navigator.pushNamed(context, CartScreen.routeName),
            );
          }),

          IconBtnWithCounter(
            svgSrc: _userIcon(),
            press: () {
              print(localstore.read("nom"));
              if (localstore.read("nom") == null) {
                Navigator.pushNamed(context, SignUpScreen.routeName);
              } else {
                Navigator.pushNamed(context, ProfileScreen.routeName);
              }
            },
          ),
        ],
      ),
    );
  }
}
