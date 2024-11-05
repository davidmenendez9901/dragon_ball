import 'package:dragon_ball/src/infrastructure/api_helper/api_helper.dart';
import 'package:dragon_ball/src/presentation/widgets/character_card_widget.dart';
import 'package:flutter/material.dart';

import '../../infrastructure/models/character_model.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
          ),
        ],
      ),
      body: FutureBuilder(
        future: ApiHelper().getCharactersList(),
        builder: (context, AsyncSnapshot<List<Character>> snapshot) {
          if (snapshot.hasData) {
            return CustomScrollView(
              slivers: [
                // Sliver para la imagen y el título
                SliverToBoxAdapter(
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.4,
                    child: Stack(
                      children: [
                        Center(
                          child: Image.network(
                            'https://dragonball-api.com/transformaciones/goku_ultra.webp',
                            fit: BoxFit.contain,
                            width: double.infinity,
                          ),
                        ),
                        Container(
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                              colors: [
                                Colors.black,
                                Colors.transparent,
                              ],
                            ),
                          ),
                        ),
                        const Positioned(
                          left: 30,
                          bottom: 10,
                          child: Text(
                            'Dragon Ball Wiki',
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                // SliverGrid para el grid de personajes
                SliverPadding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  sliver: SliverGrid(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, // Número de columnas
                      crossAxisSpacing: 10.0, // Espaciado entre columnas
                      mainAxisSpacing: 10.0, // Espaciado entre filas
                      childAspectRatio: 1.0, // Relación de aspecto
                    ),
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        return CharacterCardWidget(
                          character: snapshot.data![index],
                        );
                      },
                      childCount: snapshot.data!.length,
                    ),
                  ),
                ),
              ],
            );
          }

          // Mostrar un indicador de carga mientras se obtienen los datos
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
