import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../shared/components/common_field.dart';
import '../../shared/components/custom_snackbar.dart';
import '../../shared/components/password_field.dart';
import '../home/home_page.dart';
import 'login_cubit.dart';
import 'login_state.dart';

class LoginContent extends StatelessWidget {
  final _email = TextEditingController();
  final _pass = TextEditingController();

  LoginContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: BlocListener<LoginCubit, LoginState>(
            listener: (context, state) {
              if (state.isLogged) {
                Navigator.pushReplacementNamed(context, HomePage.route);
              }

              if (state.message != null) {
                CustomSnackbar.show(context, state.message!);
              }
            },
            child: BlocBuilder<LoginCubit, LoginState>(
                builder: (context, state) => SingleChildScrollView(
                    padding: const EdgeInsets.all(16),
                    child: Column(children: [
                      CommonField(
                          controller: _email,
                          label: 'E-mail',
                          keyboardType: TextInputType.emailAddress),
                      SizedBox(height: 16),
                      PasswordField(controller: _pass, label: 'Senha'),
                      SizedBox(height: 16),
                      OutlinedButton(
                          child:
                              Text(state.isLoading ? 'AGUARDE...' : 'ENTRAR'),
                          onPressed: () {
                            Navigator.pushNamed(context, HomePage.route);
                          })
                    ])))));
  }
}
