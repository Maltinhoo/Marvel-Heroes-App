import 'package:bloc/bloc.dart';

import '../../data/alien_repository.dart';
import '../../data/anti_hero_repository.dart';
import '../../data/heroes_repository.dart';
import '../../data/human_repository.dart';
import '../../data/villain_repository.dart';
import '../../shared/services/user_service.dart';
import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HeroesRepository heroesRepository;
  final VillainRepository villainRepository;
  final AntiHeroRepository antiHeroRepository;
  final AlienRepository alienRepository;
  final HumanRepository humanRepository;
  final UserService userService;

  HomeCubit({
    required this.antiHeroRepository,
    required this.alienRepository,
    required this.humanRepository,
    required this.villainRepository,
    required this.heroesRepository,
    required this.userService,
  }) : super(HomeState());

  void initialize() async {
    try {
      emit(HomeState(isLoading: true));
      final listHeroes = await heroesRepository.getAllHeroes();
      final listVillains = await villainRepository.getAllVillains();
      final listAntiHeroes = await antiHeroRepository.getAllAntiHeroes();
      final listAliens = await alienRepository.getAllAliens();
      final listHumans = await humanRepository.getAllHumans();
      emit(HomeState(
          isLoading: false,
          heroes: listHeroes,
          villains: listVillains,
          antiheroes: listAntiHeroes,
          aliens: listAliens,
          humans: listHumans));
    } catch (e) {
      emit(HomeState(isLoading: false, error: e.toString()));
    }
  }

  void logout() async {
    emit(HomeState(exiting: true));
    await userService.logout();
    emit(HomeState(exited: true));
  }
}
