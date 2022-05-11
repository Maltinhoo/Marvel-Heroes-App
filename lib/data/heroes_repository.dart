import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/services.dart';

import '../models/hero_model.dart';
import '../shared/exceptions/unknown_exception.dart';

class HeroesRepository {
  final Dio dio;

  HeroesRepository({required this.dio});

  Future<List<HeroModel>> getAll() async {
    try {
      // final response = await dio.get(
      //     'characters?ts=1652136795179&apikey=837252d7169267eac0014f907597f135&hash=13b8d3517cfaaccf138892101d052094');
      // return (response.data['data']['results'] as List)
      //     .map((e) => CharacterModel.fromJson(e))
      //     .toList();
      final response = await rootBundle.loadString('assets/application.json');
      final List<HeroModel> allHeroes =
          (json.decode(response)['heroes'] as List)
              .map((e) => HeroModel.fromJson(e))
              .toList();
      return allHeroes;
    } catch (e) {
      throw UnknownException();
    }
  }
}
