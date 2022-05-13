import 'dart:convert';

import 'package:flutter/services.dart';

import '../models/character_model.dart';
import '../shared/exceptions/unknown_exception.dart';

class VillainRepository {
  VillainRepository();

  Future<List<CharacterModel>> getAllVillains() async {
    try {
      final response = await rootBundle.loadString('assets/application.json');
      final List<CharacterModel> allVillains =
          (json.decode(response)['villains'] as List)
              .map((e) => CharacterModel.fromJson(e))
              .toList();
      return allVillains;
    } catch (e) {
      throw UnknownException();
    }
  }
}
