import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon/data_provider/pokemon_provider.dart';
import 'package:pokemon/repository/implementation/pokemon_repository.dart';
import 'package:pokemon/repository/pokemon_repository.dart';

import 'navigation/routes.dart';

void main() async {
  final pokemonProvider = PokemonProvider();
  final pokemonRepository = PokemonRepository(pokemonProvider);

  runApp(RepositoryProvider<PokemonRepositoryBase>(
    create: (_) => pokemonRepository,
    child: const App(),
  ));
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pokemon app',
      onGenerateRoute: (settings) => Routes.routes(settings),
    );
  }
}
