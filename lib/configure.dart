import 'package:dio/dio.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'data/alien_repository.dart';
import 'data/anti_hero_repository.dart';
import 'data/heroes_repository.dart';
import 'data/human_repository.dart';
import 'data/villain_repository.dart';
import 'environment.dart';
import 'modules/character/character_cubit.dart';
import 'modules/home/home_cubit.dart';
import 'modules/wrapper/wrapper_cubit.dart';
import 'shared/services/user_service.dart';

Future<void> configure() async {
  final sharedPreferences = await SharedPreferences.getInstance();
  GetIt.I.registerSingleton<BaseCacheManager>(DefaultCacheManager());

  GetIt.I
      .registerFactory<Dio>(() => Dio(BaseOptions(baseUrl: Environment.api)));

  GetIt.I.registerSingleton<UserService>(
      UserService(preferences: sharedPreferences));

  GetIt.I.registerSingleton<WrapperCubit>(WrapperCubit(
    userService: GetIt.I.get<UserService>(),
  ));

  GetIt.I.registerSingleton<HomeCubit>(HomeCubit(
    userService: GetIt.I.get<UserService>(),
    heroesRepository: HeroesRepository(
      dio: GetIt.I.get<Dio>(),
    ),
    villainRepository: VillainRepository(),
    alienRepository: AlienRepository(),
    antiHeroRepository: AntiHeroRepository(),
    humanRepository: HumanRepository(),
  ));

  GetIt.I.registerFactory<CharacterCubit>(() => CharacterCubit());
}
