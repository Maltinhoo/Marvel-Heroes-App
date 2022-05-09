import 'package:bloc/bloc.dart';

import '../../data/heroes_repository.dart';
import '../../shared/services/user_service.dart';
import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HeroesRepository heroesRepository;
  final UserService userService;

  HomeCubit({
    required this.heroesRepository,
    required this.userService,
  }) : super(HomeState());

  void initialize() async {
    try {
      final listHeroes = await heroesRepository.getAll();
      print(listHeroes);
    } catch (e) {}
  }

  void logout() async {
    emit(HomeState(exiting: true));
    await userService.logout();
    emit(HomeState(exited: true));
  }
}
