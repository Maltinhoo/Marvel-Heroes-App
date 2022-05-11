import 'package:equatable/equatable.dart';

import '../../models/hero_model.dart';

class HomeState extends Equatable {
  final bool exiting;
  final bool exited;
  final bool isLoading;
  final String? error;
  final List<HeroModel>? heroes;

  HomeState({
    this.isLoading = false,
    this.error,
    this.heroes = const [],
    this.exiting = false,
    this.exited = false,
  });

  @override
  List<Object?> get props => [exiting, exited, isLoading, error, heroes];
}
