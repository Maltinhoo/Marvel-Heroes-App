import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../models/character_model.dart';
import 'character_content.dart';
import 'character_cubit.dart';

class CharacterPage extends StatelessWidget {
  static String route = '/character';
  final CharacterModel characterModel;

  const CharacterPage({Key? key, required this.characterModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
              icon: Icon(
                Icons.arrow_back_ios_new,
                color: Colors.black,
              ),
              onPressed: () {
                Navigator.pop(context);
              }),
        ),
        body: BlocProvider(
            create: (context) => GetIt.I.get<CharacterCubit>(),
            child: CharacterContent(
              characterModel: characterModel,
            )));
  }
}
