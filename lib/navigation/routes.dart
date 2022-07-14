import 'package:flutter/material.dart';

import '../screens/Pokemon_screen.dart';

class Routes {
  static const pokemon = '/';
  static const pokemonDetails = '/details';

  static Route routes(RouteSettings settings) {
    // final args = settings.arguments;

    switch (settings.name) {
      case pokemon:
        return MaterialPageRoute(
            builder: (context) => PokemonScreen.create(context));
    }
    throw Exception('This route does not exists');
  }
}
