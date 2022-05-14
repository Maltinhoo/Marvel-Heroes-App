import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import 'home_content.dart';
import 'home_cubit.dart';

class HomePage extends StatelessWidget {
  static String route = '/home';

  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Center(
              child: Image.asset('assets/logotipoMarvel.png', width: 100)),
          leading: IconButton(
              icon: Icon(
                Icons.list,
                color: Colors.black,
              ),
              onPressed: () {}),
          actions: [
            IconButton(
              icon: Icon(
                Icons.search,
                color: Colors.black,
              ),
              onPressed: () {},
            )
          ],
        ),
        body: BlocProvider(
            create: (context) => GetIt.I.get<HomeCubit>()..initialize(),
            child: HomeContent()));
  }
}
