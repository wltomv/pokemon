import 'package:flutter/material.dart';

import '../models/models.dart';
import '../screens/Pokemon_screen.dart';
import '../screens/pokemon_detail_screen.dart';

class Routes {
  static const pokemon = '/';
  static const pokemonDetails = '/details';

  static Route routes(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case pokemon:
        return MaterialPageRoute(
            builder: (context) => PokemonScreen.create(context));
      case pokemonDetails:
        final argument = args as DetailsArguments;
        return MaterialPageRoute(
            builder: (context) =>
                PokemonDetailScreen.create(argument.pokemon, argument.heroTag));
    }
    throw Exception('This route does not exists');
  }
}
