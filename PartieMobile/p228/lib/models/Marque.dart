import 'package:flutter/material.dart';

class Marque {
  final int id;
  final String title, description, image, marque, categorie;
  final double poids, price;

  Marque({
    required this.id,
    required this.image,
    required this.poids,
    required this.title,
    required this.marque,
    required this.categorie,
    required this.price,
    required this.description,
  });
}

// Our demo Products

