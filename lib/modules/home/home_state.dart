import 'package:equatable/equatable.dart';

import '../../models/character_model.dart';

class HomeState extends Equatable {
  final bool exiting;
  final bool exited;
  final bool isLoading;
  final String? error;
  final List<CharacterModel> heroes;
  final List<CharacterModel> villains;
  final List<CharacterModel> antiheroes;
  final List<CharacterModel> aliens;
  final List<CharacterModel> humans;

  HomeState({
    this.antiheroes = const [],
    this.aliens = const [],
    this.humans = const [],
    this.isLoading = false,
    this.error,
    this.heroes = const [],
    this.villains = const [],
    this.exiting = false,
    this.exited = false,
  });

  @override
  List<Object?> get props => [
        exiting,
        exited,
        isLoading,
        error,
        heroes,
        villains,
        antiheroes,
        aliens,
        humans
      ];
}
