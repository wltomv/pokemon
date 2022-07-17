import 'package:flutter/material.dart';

import '../models/models.dart';
import '../common/consts/pokemon_colors.dart';
import '../widgets/type_widget.dart';

class PokemonDetailScreen extends StatelessWidget {
  final Pokemon pokemon;
  final Object heroTag;
  const PokemonDetailScreen(
      {Key? key, required this.pokemon, required this.heroTag})
      : super(key: key);

  static Widget create(Object pokemon, Object heroTag) => PokemonDetailScreen(
        pokemon: pokemon as Pokemon,
        heroTag: heroTag,
      );

  @override
  Widget build(BuildContext context) {
    final color = typeColor[pokemon.types[0].type.name] ?? Colors.grey;
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: color,
      appBar: AppBar(
        backgroundColor: color,
        elevation: 0,
      ),
      body: Stack(
        alignment: Alignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: SizedBox(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        pokemon.name,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.left,
                      ),
                      Text(
                        "Base Exp ${pokemon.baseExperience}",
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                        ),
                        textAlign: TextAlign.left,
                      )
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: pokemon.types
                            .map((e) =>
                                Center(child: TypeWidget(type: e.type.name)))
                            .toList(),
                      ),
                      const Flexible(
                        child: SizedBox(
                          height: 100,
                          width: 100,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 1.7,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    topLeft: Radius.circular(20),
                  ),
                  color: Colors.white),
            ),
          ),
          Positioned(
            top: (height * 0.04),
            child: Hero(
              tag: heroTag,
              child: Image.network(
                pokemon.sprites.other?.officialArtwork.frontDefault ??
                    pokemon.sprites.frontDefault,
                height: 200,
                fit: BoxFit.fitHeight,
              ),
            ),
          )
        ],
      ),
    );
  }
}
