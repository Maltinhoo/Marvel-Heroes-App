import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../shared/components/character_card.dart';
import '../login/login_page.dart';
import 'components/category_row.dart';
import 'components/common_row.dart';
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
                        CommonRow(title: 'Heróis'),
                        SizedBox(
                          height: constraints.maxHeight * 0.4,
                          width: constraints.maxWidth * 1,
                          child: ListView.builder(
                              itemCount: state.heroes.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return CharacterCard(
                                    constraints: constraints,
                                    charModel: state.heroes[index]);
                              }),
                        ),
                        SizedBox(height: constraints.maxHeight * 0.05),
                        CommonRow(title: 'Vilões'),
                        SizedBox(
                          height: constraints.maxHeight * 0.4,
                          width: constraints.maxWidth * 1,
                          child: ListView.builder(
                              itemCount: state.villains.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return CharacterCard(
                                    constraints: constraints,
                                    charModel: state.villains[index]);
                              }),
                        ),
                        SizedBox(height: constraints.maxHeight * 0.05),
                        CommonRow(title: 'Anti-Heróis'),
                        SizedBox(
                          height: constraints.maxHeight * 0.4,
                          width: constraints.maxWidth * 1,
                          child: ListView.builder(
                              itemCount: state.antiheroes.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return CharacterCard(
                                    constraints: constraints,
                                    charModel: state.antiheroes[index]);
                              }),
                        ),
                        SizedBox(height: constraints.maxHeight * 0.05),
                        CommonRow(title: 'Alienígenas'),
                        SizedBox(
                          height: constraints.maxHeight * 0.4,
                          width: constraints.maxWidth * 1,
                          child: ListView.builder(
                              itemCount: state.aliens.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return CharacterCard(
                                    constraints: constraints,
                                    charModel: state.aliens[index]);
                              }),
                        ),
                        SizedBox(height: constraints.maxHeight * 0.05),
                        CommonRow(title: 'Humanos'),
                        SizedBox(
                          height: constraints.maxHeight * 0.4,
                          width: constraints.maxWidth * 1,
                          child: ListView.builder(
                              itemCount: state.humans.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return CharacterCard(
                                    constraints: constraints,
                                    charModel: state.humans[index]);
                              }),
                        ),
                      ],
                    ),
                  ),
                )),
      );
    });
  }
}
