import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../shared/components/character_card.dart';
import '../login/login_page.dart';
import 'components/category_row.dart';
import 'home_cubit.dart';
import 'home_state.dart';

class HomeContent extends StatelessWidget {
  static String route = '/home';

  const HomeContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return BlocListener<HomeCubit, HomeState>(
        listener: (context, state) {
          if (state.exited) {
            Navigator.pushNamedAndRemoveUntil(
                context, LoginPage.route, (route) => false);
          }
        },
        child: BlocBuilder<HomeCubit, HomeState>(
            builder: (context, state) => Padding(
                  padding: const EdgeInsets.all(12),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            'Bem vindo ao Marvel Heroes',
                            style: TextStyle(
                                fontFamily: 'GilroyMedium',
                                fontSize: 14,
                                color: Colors.grey,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        Text(
                          'Escolha o seu personagem',
                          style: TextStyle(
                            fontFamily: 'GilroyHeavy',
                            fontSize: 32,
                          ),
                        ),
                        SizedBox(height: constraints.maxHeight * 0.05),
                        CategoryRow(constraints: constraints),
                        SizedBox(height: constraints.maxHeight * 0.05),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text(
                              'Heróis',
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.red,
                                  fontFamily: 'GilroyBold',
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              'Ver tudo',
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey,
                                  fontFamily: 'GilroyMedium',
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: constraints.maxHeight * 0.4,
                          width: constraints.maxWidth * 1,
                          child: ListView.builder(
                              itemCount: state.heroes.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return CharacterCard(
                                    constraints: constraints,
                                    heroModel: state.heroes[index]);
                              }),
                        )
                      ],
                    ),
                  ),
                )),
      );
    });
  }
}
