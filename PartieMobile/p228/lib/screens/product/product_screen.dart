import 'package:flutter/material.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({Key? key}) : super(key: key);

  static String routeName = "/products";

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class MoreProductArguments {
  final int id;
  final String type;

  MoreProductArguments(this.id, this.type);
}
