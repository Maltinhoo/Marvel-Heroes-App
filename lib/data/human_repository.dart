import 'dart:convert';

import 'package:flutter/services.dart';

import '../models/character_model.dart';
import '../shared/exceptions/unknown_exception.dart';

class HumanRepository {
  HumanRepository();

  Future<List<CharacterModel>> getAllHumans() async {
    try {
      final response = await rootBundle.loadString('assets/application.json');
      final List<CharacterModel> allHumans =
          (json.decode(response)['humans'] as List)
              .map((e) => CharacterModel.fromJson(e))
              .toList();
      return allHumans;
    } catch (e) {
      throw UnknownException();
    }
  }
}
