import 'dart:convert';

import 'package:flutter/services.dart';

import '../models/character_model.dart';
import '../shared/exceptions/unknown_exception.dart';

class AlienRepository {
  AlienRepository();

  Future<List<CharacterModel>> getAllAliens() async {
    try {
      final response = await rootBundle.loadString('assets/application.json');
      final List<CharacterModel> allAliens =
          (json.decode(response)['aliens'] as List)
              .map((e) => CharacterModel.fromJson(e))
              .toList();
      return allAliens;
    } catch (e) {
      throw UnknownException();
    }
  }
}
