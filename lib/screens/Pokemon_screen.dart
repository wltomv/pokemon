import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon/bloc/pokemon_cubit.dart';

class PokemonScreen extends StatelessWidget {
  const PokemonScreen({Key? key}) : super(key: key);

  static Widget create(BuildContext context) {
    return BlocProvider<PokemonCubit>(
      create: (_) => PokemonCubit(context.read())..loadPokemon(),
      child: const PokemonScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pokemon list'),
      ),
      body: BlocBuilder<PokemonCubit, PokemonState>(
        builder: ((context, state) {
          if (state is PokemonCompleteState) {
            return ListView.builder(
              itemCount: state.pokemon.length,
              itemBuilder: (_, index) => Text(state.pokemon[index].name),
            );
          } else if (state is PokemonErrorState) {
            return Text(state.message);
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        }),
      ),
    );
  }
}
