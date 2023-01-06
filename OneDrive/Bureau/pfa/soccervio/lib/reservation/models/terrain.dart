class Recipe {
  final String name;
  final String images;
  final double rating;
  final String totalTime;

  Recipe(
      {required this.name,
      required this.images,
      required this.rating,
      required this.totalTime});

  factory Recipe.fromJson(dynamic json) {
    return Recipe(
        name: json['name'] as String,
        images: json['images'][0]['hostedLargeUrl'] as String,
        rating: json['rating'] as double,
        totalTime: json['totalTime'] as String);
  }

  static List<Recipe> recipesFromSnapshot(List snapshot) {
    return snapshot.map((data) {
      return Recipe.fromJson(data);
    }).toList();
  }

  @override
  String toString() {
    return 'Recipe {name: $name, image: $images, rating: $rating, totalTime: $totalTime}';
  }
}

// terrains
class terrain {
  final int id;
  final String titre;
  final String images;
  final double longitude;
  final double latitude;
  final String description;
  final String adresse;
  final String heureO;
  final String heureF;
  final int prixHr;
  final int nbrJoueur;
  final bool avecDouche;
  final bool assure;
  final Proprietaire proprietaire;

  terrain(
      {required this.id,
      required this.titre,
      required this.images,
      required this.longitude,
      required this.latitude,
      required this.description,
      required this.adresse,
      required this.heureO,
      required this.heureF,
      required this.prixHr,
      required this.nbrJoueur,
      required this.avecDouche,
      required this.assure,
      required this.proprietaire});

  factory terrain.fromJson(dynamic json) {
    return terrain(
        id: json['id'] as int,
        titre: json['titre'] as String,
        images: json['images'][0]['hostedLargeUrl'] as String,
        longitude: json['longitude'] as double,
        latitude: json['latitude'] as double,
        description: json['description'] as String,
        adresse: json['adresse'] as String,
        heureO: json['heureO'] as String,
        heureF: json['heureF'] as String,
        prixHr: json['prixHr'] as int,
        nbrJoueur: json['nbrJoueur'] as int,
        avecDouche: json['avecDouche'] as bool,
        assure: json['assure'] as bool,
        proprietaire: json['proprietaire'] as Proprietaire);
  }
  static List<terrain> terrainsFromSnapshot(List snapshot) {
    return snapshot.map((data) {
      return terrain.fromJson(data);
    }).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['titre'] = this.titre;
    data['images'] = this.images;
    data['longitude'] = this.longitude;
    data['latitude'] = this.latitude;
    data['description'] = this.description;
    data['adresse'] = this.adresse;
    data['heureO'] = this.heureO;
    data['heureF'] = this.heureF;
    data['prixHr'] = this.prixHr;
    data['nbrJoueur'] = this.nbrJoueur;
    data['avecDouche'] = this.avecDouche;
    data['assure'] = this.assure;
    if (this.proprietaire != null) {
      data['proprietaire'] = this.proprietaire!.toJson();
    }
    return data;
  }
}

class Proprietaire {
  final int id;
  final String nomComplet;
  final String username;
  final String email;

  Proprietaire(
      {required this.id,
      required this.nomComplet,
      required this.username,
      required this.email});

  factory Proprietaire.fromJson(dynamic json) {
    return Proprietaire(
        id: json['id'] as int,
        nomComplet: json['nomComplet'] as String,
        username: json['username'] as String,
        email: json['email'] as String);
  }

  static List<Proprietaire> ProprietairesFromSnapshot(List snapshot) {
    return snapshot.map((data) {
      return Proprietaire.fromJson(data);
    }).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nomComplet'] = this.nomComplet;
    data['username'] = this.username;
    data['email'] = this.email;
    return data;
  }
}
