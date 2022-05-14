import 'dart:convert';

import 'package:flutter/services.dart';

import '../models/character_model.dart';
import '../shared/exceptions/unknown_exception.dart';

class AntiHeroRepository {
  AntiHeroRepository();

  Future<List<CharacterModel>> getAllAntiHeroes() async {
    try {
      final response = await rootBundle.loadString('assets/application.json');
      final List<CharacterModel> allAntiHeroes =
          (json.decode(response)['antiHeroes'] as List)
              .map((e) => CharacterModel.fromJson(e))
              .toList();
      return allAntiHeroes;
    } catch (e) {
      throw UnknownException();
    }
  }
}
