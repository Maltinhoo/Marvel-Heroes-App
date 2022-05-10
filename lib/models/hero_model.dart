import 'ability_model.dart';
import 'caracterustic_model.dart';

class HeroModel {
  String? name;
  String? alterEgo;
  String? imagePath;
  String? biography;
  CaracteristicModel? caracteristicModel;
  AbilityModel? abilityModel;
  List<dynamic>? movies;

  HeroModel({
    this.name,
    this.alterEgo,
    this.imagePath,
    this.biography,
    this.caracteristicModel,
    this.abilityModel,
    this.movies = const [],
  });

  HeroModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    alterEgo = json['alterEgo'];
    imagePath = json['imagePath'];
    biography = json['biography'];
    caracteristicModel = CaracteristicModel.fromJson(json['caracteristics']);
    abilityModel = AbilityModel.fromJson(json['abilities']);
    movies = (json['movies'] as List<dynamic>).map((e) => e).toList();
  }
}
