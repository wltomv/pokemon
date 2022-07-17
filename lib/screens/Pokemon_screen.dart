import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon/bloc/pokemon_cubit.dart';
import 'package:pokemon/widgets/pokemon_item.dart';

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
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            expandedHeight: 200,
            backgroundColor: Colors.white,
            flexibleSpace: _frontpage(),
          ),
          BlocBuilder<PokemonCubit, PokemonState>(
            builder: (context, state) {
              if (state is PokemonCompleteState) {
                return SliverGrid(
                  delegate: SliverChildBuilderDelegate(
                      (context, index) => Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: PokemonItem(
                                pokemon: state.pokemon[index], index: index),
                          ),
                      childCount: state.pokemon.length),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                );
              }
              return SliverToBoxAdapter(
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height - 200,
                  child: const Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _frontpage() => Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'assets/images/wall.jpeg',
            fit: BoxFit.cover,
          ),
          Positioned(
            top: -50,
            right: -50,
            child: Image.asset(
              'assets/images/pokeball.png',
              width: 200,
              fit: BoxFit.fitWidth,
            ),
          ),
          Image.asset(
            'assets/images/title.png',
          ),
        ],
      );
}
