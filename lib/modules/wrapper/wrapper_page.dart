import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import 'wrapper_content.dart';
import 'wrapper_cubit.dart';

class WrapperPage extends StatelessWidget {
  const WrapperPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocProvider<WrapperCubit>(
            create: (_) => GetIt.I.get<WrapperCubit>()..initialize(),
            child: WrapperContent()));
  }
}
