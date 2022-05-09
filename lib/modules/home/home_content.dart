import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../login/login_page.dart';
import 'home_cubit.dart';
import 'home_state.dart';

class HomeContent extends StatelessWidget {
  static String route = '/home';

  const HomeContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<HomeCubit, HomeState>(
      listener: (context, state) {
        if (state.exited) {
          Navigator.pushNamedAndRemoveUntil(
              context, LoginPage.route, (route) => false);
        }
      },
      child: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) => Center(
              child: OutlinedButton(
                  onPressed: state.exited
                      ? null
                      : () => BlocProvider.of<HomeCubit>(context).logout(),
                  child: Text('SAIR')))),
    );
  }
}
