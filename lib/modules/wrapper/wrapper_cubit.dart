import 'package:bloc/bloc.dart';
import '../../shared/services/user_service.dart';
import 'wrapper_state.dart';

class WrapperCubit extends Cubit<WrapperState> {
  final UserService userService;

  WrapperCubit({
    required this.userService,
  }) : super(WrapperState());

  void initialize() async {
    emit(WrapperState(isLoading: true));
    final isLogged = await userService.isLogged();
    emit(WrapperState(isLoading: false, isLogged: isLogged));
  }
}
