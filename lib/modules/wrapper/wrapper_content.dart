import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../home/home_page.dart';
import 'wrapper_cubit.dart';
import 'wrapper_state.dart';

class WrapperContent extends StatelessWidget {
  const WrapperContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<WrapperCubit, WrapperState>(
        listener: (context, state) {
          if (!state.isLoading && state.isLogged) {
            Navigator.pushReplacementNamed(context, HomePage.route);
          } else if (!state.isLoading && !state.isLogged) {
            Navigator.pushReplacementNamed(context, HomePage.route);
          }
        },
        child: Center(child: CircularProgressIndicator()));
  }
}
