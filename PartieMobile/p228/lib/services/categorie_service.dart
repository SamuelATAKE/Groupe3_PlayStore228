class Categorie {
  final int id;
  final String libelle;
  final String photo;

  const Categorie(
      {required this.libelle, required this.id, required this.photo});

  // factory Categorie.fromJson(Map<String, dynamic> json) => Categorie(
  //       libelle: json['libelle'],
  //       id: json['id'],
  //       photo: json['photo'],
  //     );

  // Map<String, dynamic> toJson() => {
  //       "id": id,
  //       "libelle": libelle,
  //       "photo": photo,
  //     };
}

class SousCategorie {
  final List<Articles> articles;

  SousCategorie(this.articles);
}

class Articles {
  final int id;
  final String libelle;
  final String photo;
  final String details;
  final double prix_vente;
  final double poids;
  final String marque;
  final String categorie;

  const Articles({
    required this.libelle,
    required this.id,
    required this.photo,
    required this.details,
    required this.prix_vente,
    required this.poids,
    required this.marque,
    required this.categorie,
  });
}

class Marque {
  final int id;
  final String libelle;
  final String photo;

  Marque(this.libelle, this.photo, this.id);
}
