import 'package:flutter/material.dart';

import '../../models/character_model.dart';
import '../../modules/character/character_page.dart';

class CharacterCard extends StatelessWidget {
  final BoxConstraints constraints;
  final CharacterModel characterModel;

  const CharacterCard(
      {Key? key, required this.constraints, required this.characterModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 12),
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, CharacterPage.route,
              arguments: characterModel);
        },
        child: Stack(alignment: Alignment.bottomCenter, children: [
          Container(
            height: constraints.maxHeight * 0.4,
            width: constraints.maxWidth * 0.4,
            decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.all(Radius.circular(10)),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      offset: Offset(0, 4),
                      blurRadius: 8)
                ]),
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              child: Image.asset(
                characterModel.imagePath ?? 'Indisponivel',
                fit: BoxFit.fill,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(8),
            height: constraints.maxHeight * 0.12,
            width: constraints.maxWidth * 0.4,
            decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.all(Radius.circular(10)),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      offset: Offset(0, 4),
                      blurRadius: 8)
                ]),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(characterModel.alterEgo ?? 'Indisponivel',
                  style: TextStyle(fontSize: 12, color: Colors.grey)),
              Text(
                characterModel.name ?? 'Indisponivel',
                style: TextStyle(
                    fontFamily: 'GilroyHeavy',
                    fontSize: 20,
                    color: Colors.white),
              )
            ]),
          )
        ]),
      ),
    );
  }
}
