import 'package:flutter/material.dart';

class Product {
  final int id;
  final String title,
      description,
      image,
      categorie,
      file,
      condition,
      package,
      version;

  Product({
    required this.id,
    required this.image,
    required this.title,
    required this.categorie,
    required this.description,
    required this.file,
    required this.package,
    required this.condition,
    required this.version,
  });
}

Product produit1 = Product(
    id: 1,
    image: "assets/images/togozik.png",
    title: "TogoZik",
    categorie: "Music",
    description: "Description de l'application",
    file: "https://google.com",
    package: "com.package.com",
    condition: "https://google.com",
    version: "0.1.2");
Product produit2 = Product(
    id: 2,
    image: "assets/images/whatsapp.png",
    title: "Whatsapp",
    categorie: "Messagerie",
    description: "Description de l'application",
    file: "https://google.com",
    package: "com.package.com",
    condition: "https://google.com",
    version: "0.1.2");
Product produit3 = Product(
    id: 3,
    image: "assets/images/serveur-client.png",
    title: "LSERVER",
    categorie: "Informatique",
    description: "Description de l'application",
    file: "assets/apk/lserver.apk",
    package: "com.package.com",
    condition: "https://google.com",
    version: "0.1.0");
Product produit4 = Product(
    id: 4,
    image: "assets/images/gozemlog.png",
    title: "Gozem",
    categorie: "Course",
    description: "Description de l'application",
    file: "https://google.com",
    package: "com.package.com",
    condition: "https://google.com",
    version: "0.1.2");
