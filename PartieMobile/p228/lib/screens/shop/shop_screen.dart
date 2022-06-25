import 'package:flutter/material.dart';
import 'package:shop_app/components/coustom_bottom_nav_bar.dart';
import 'package:shop_app/enums.dart';
import 'package:shop_app/navbar/nav_bar.dart';
import 'package:shop_app/size_config.dart';

import 'components/body.dart';

class ShopScreen extends StatelessWidget {
  static String routeName = "/shop";
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      drawer: NavBar(),
      body: Body(),
    );
  }
}
