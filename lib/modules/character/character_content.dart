import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/character_model.dart';
import 'character_cubit.dart';

class CharacterContent extends StatelessWidget {
  final CharacterModel characterModel;

  const CharacterContent({Key? key, required this.characterModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return BlocListener<CharacterCubit, CharacterState>(
        listener: (context, state) {},
        child: BlocBuilder<CharacterCubit, CharacterState>(
            builder: (context, state) => SingleChildScrollView(
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          Hero(
                              tag: characterModel,
                              child: Container(
                                  width: constraints.maxWidth * 1,
                                  height: constraints.maxHeight * 0.6,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  child: Image.asset(
                                    characterModel.imagePath ?? '',
                                    fit: BoxFit.fill,
                                  ))),
                          Container(
                            width: constraints.maxWidth * 1,
                            height: constraints.maxHeight * 0.3,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: const [Colors.black12, Colors.black87],
                              ),
                            ),
                          ),
                          Positioned(
                            top: kToolbarHeight,
                            left: 0,
                            child: IconButton(
                              icon: Icon(Icons.arrow_back),
                              color: Colors.white,
                              onPressed: () => Navigator.of(context).pop(),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                )),
      );
    });
  }
}
