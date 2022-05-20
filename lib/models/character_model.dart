import 'ability_model.dart';
import 'caracteristic_model.dart';

class CharacterModel {
  String? name;
  String? alterEgo;
  String? imagePath;
  String? biography;
  CaracteristicModel? caracteristicModel;
  AbilityModel? abilityModel;
  List<String>? movies;

  CharacterModel({
    this.name,
    this.alterEgo,
    this.imagePath,
    this.biography,
    this.caracteristicModel,
    this.abilityModel,
    this.movies = const [],
  });

  CharacterModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    alterEgo = json['alterEgo'];
    imagePath = json['imagePath'];
    biography = json['biography'];
    caracteristicModel = CaracteristicModel.fromJson(json['caracteristics']);
    abilityModel = AbilityModel.fromJson(json['abilities']);
    movies = (json['movies'] as List<dynamic>)
        .map((movie) => movie.toString())
        .toList();
  }
}
