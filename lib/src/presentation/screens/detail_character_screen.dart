import 'package:dragon_ball/src/infrastructure/models/character_model.dart';
import 'package:flutter/material.dart';

class DetailCharacterScreen extends StatelessWidget {
  const DetailCharacterScreen({
    super.key,
    required this.character,
  });
  final Character character;
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: [
          SizedBox(
            height: size.height * 0.4,
            child: Center(
              child: Image.network(character.image.toString()),
            ),
          ),
          Center(
            child: Text(
              character.name.toString(),
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
          ),
          Padding(
            padding:const EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Ki: ${character.ki}'),
                  Text('Genero: ${character.gender}'),
                ],),
                Column(mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('Ki Maximo: ${character.maxKi}'),
                    Text('Raza: ${character.race}'),
                  ],)


              ],
            ),
          ),
          Padding(
            padding:const EdgeInsets.all(10),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Descripcion:',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                Text(character.description.toString()),
              ],
            ),
          ),


        ],
      ),
    );
  }
}
