import 'package:flutter/material.dart';
import 'package:pokemon/widgets/type_widget.dart';

import '../common/consts/pokemon_colors.dart';
import '../models/models.dart';
import '../navigation/routes.dart';

class PokemonItem extends StatelessWidget {
  final Pokemon pokemon;
  final int index;

  const PokemonItem({Key? key, required this.pokemon, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, Routes.pokemonDetails,
          arguments: DetailsArguments(pokemon, index)),
      child: Container(
        decoration: BoxDecoration(
          color: typeColor[pokemon.types[0].type.name] ?? Colors.grey,
          borderRadius: const BorderRadius.all(
            Radius.circular(25),
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              bottom: -10,
              right: -10,
              child: Image.asset(
                'assets/images/pokeball.png',
                height: 100,
                fit: BoxFit.fitHeight,
              ),
            ),
            Positioned(
              bottom: 5,
              right: 5,
              child: Hero(
                tag: index,
                child: Image.network(
                  pokemon.sprites.other?.officialArtwork.frontDefault ??
                      pokemon.sprites.frontDefault,
                  height: 115,
                  fit: BoxFit.fitHeight,
                  loadingBuilder: (_, child, loadingProgress) {
                    if (loadingProgress == null) {
                      return child;
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(
                          color: Colors.white,
                        ),
                      );
                    }
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Text(
                          pokemon.name,
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ),
                      Text(
                        'EXP ${pokemon.baseExperience}',
                        style: TextStyle(
                          color: Colors.black.withOpacity(0.4),
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
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
          ],
        ),
      ),
    );
  }
}
