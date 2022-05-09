import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import 'login_content.dart';
import 'login_cubit.dart';

class LoginPage extends StatelessWidget {
  static String route = '/login';

  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider<LoginCubit>(
        create: (context) => GetIt.I.get<LoginCubit>(),
        child: LoginContent(),
      ),
    );
  }
}
