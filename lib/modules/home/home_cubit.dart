import 'package:bloc/bloc.dart';

import '../../data/heroes_repository.dart';
import '../../data/villain_repository.dart';
import '../../shared/services/user_service.dart';
import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HeroesRepository heroesRepository;
  final VillainRepository villainRepository;
  final UserService userService;

  HomeCubit({
    required this.villainRepository,
    required this.heroesRepository,
    required this.userService,
  }) : super(HomeState());

  void initialize() async {
    try {
      emit(HomeState(isLoading: true));
      final listHeroes = await heroesRepository.getAllHeroes();
      final listVillains = await villainRepository.getAllVillains();
      print(listHeroes);
      emit(HomeState(
          isLoading: false, heroes: listHeroes, villains: listVillains));
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
