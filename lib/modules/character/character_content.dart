import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/character_model.dart';
import '../../shared/resources/styles.dart';
import 'character_cubit.dart';
import 'components/bar_generator.dart';

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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            children: [
                              Image.asset(
                                "assets/icons/age.png",
                                color: Colors.white,
                              ),
                              Text(
                                "${(2020 - int.parse(characterModel.caracteristicModel!.birth!))} anos",
                                style: caracteristic,
                              )
                            ],
                          ),
                          Column(
                            children: [
                              Image.asset("assets/icons/weight.png",
                                  color: Colors.white),
                              Text(
                                "${characterModel.caracteristicModel!.weight}kg"
                                    .toString(),
                                style: caracteristic,
                              )
                            ],
                          ),
                          Column(
                            children: [
                              Image.asset("assets/icons/height.png",
                                  color: Colors.white),
                              Text(
                                "${characterModel.caracteristicModel!.height}m"
                                    .toString(),
                                style: caracteristic,
                              )
                            ],
                          ),
                          Column(
                            children: [
                              Image.asset("assets/icons/universe.png",
                                  color: Colors.white),
                              Text(
                                characterModel.caracteristicModel!.universe!,
                                style: caracteristic,
                              )
                            ],
                          )
                        ],
                      ),
                      SizedBox(height: 20),
                      SizedBox(
                        width: constraints.maxWidth * 0.9,
                        child: Text(
                          characterModel.biography!,
                          style: description,
                        ),
                      ),
                      SizedBox(height: 20),
                      SizedBox(
                        width: constraints.maxWidth * 0.9,
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Habilidades',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 15),
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Container(
                        child: Column(children: [
                          barGenerator(
                              "Força", characterModel.abilityModel!.force!),
                          barGenerator("Inteligência",
                              characterModel.abilityModel!.intelligence!),
                          barGenerator("Agilidade",
                              characterModel.abilityModel!.agility!),
                          barGenerator("Resistência",
                              characterModel.abilityModel!.endurance!),
                          barGenerator("Velocidade",
                              characterModel.abilityModel!.velocity!),
                        ]),
                      )
                    ],
                  ),
                )),
      );
    });
  }
}
