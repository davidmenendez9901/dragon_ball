import 'package:dragon_ball/src/infrastructure/models/character_model.dart';
import 'package:dragon_ball/src/presentation/screens/detail_character_screen.dart';
import 'package:flutter/material.dart';

class CharacterCardWidget extends StatelessWidget {
  const CharacterCardWidget({
    super.key,
    required this.character,
  });

  final Character character;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => DetailCharacterScreen(character: character),
          ),
        );
      },
      child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [

            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(4.0),
                topRight: Radius.circular(4.0),
              ),
              child: SizedBox(
                height: 125,
                width: double.infinity,
                child: Image.network(
                  character.image.toString(),
                  fit: BoxFit.contain,
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(8),
              child: Text(
                character.name.toString(),
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
