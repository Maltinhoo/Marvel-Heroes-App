import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../models/character_model.dart';
import '../../shared/resources/styles.dart';
import 'character_content.dart';
import 'character_cubit.dart';

class CharacterPage extends StatelessWidget {
  static String route = '/character';
  final CharacterModel characterModel;

  const CharacterPage({Key? key, required this.characterModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetIt.I.get<CharacterCubit>(),
      child: LayoutBuilder(builder: (context, constraints) {
        return Scaffold(
            backgroundColor: Colors.black,
            body: CustomScrollView(
              slivers: [
                SliverAppBar(
                  backgroundColor: Colors.transparent,
                  expandedHeight: constraints.maxHeight * .5,
                  flexibleSpace: FlexibleSpaceBar(
                    title: Align(
                      alignment: Alignment.bottomLeft,
                      child: Container(
                          color: Colors.transparent,
                          width: constraints.maxWidth * .4,
                          height: constraints.maxHeight * .06,
                          child: Column(children: [
                            Text(
                              characterModel.alterEgo!,
                              style: profileSubtitle,
                            ),
                            Text(
                              characterModel.name!,
                              style: profileTitle,
                            ),
                          ])),
                    ),
                    background: Stack(
                      children: [
                        Hero(
                            tag: characterModel.name!,
                            child: Container(
                              // height: constraints.maxHeight * 0.4,
                              decoration: BoxDecoration(
                                  color: Colors.transparent,
                                  image: DecorationImage(
                                      fit: BoxFit.fill,
                                      image: AssetImage(
                                        characterModel.imagePath ?? '',
                                      ))),
                            )),
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: const [
                                    Colors.transparent,
                                    Colors.black,
                                  ])),
                        ),
                      ],
                    ),
                  ),
                  leading: IconButton(
                      icon: Icon(
                        Icons.arrow_back_ios_new,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      }),
                ),
                SliverToBoxAdapter(
                  child: CharacterContent(characterModel: characterModel),
                )
              ],
            )
            // BlocProvider(
            //     create: (context) => GetIt.I.get<CharacterCubit>(),
            //     child: CharacterContent(
            //       characterModel: characterModel,
            //     ))

            );
      }),
    );
  }
}
