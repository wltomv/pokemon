import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon/models/models.dart';
import 'package:pokemon/repository/pokemon_repository.dart';

class PokemonCubit extends Cubit<PokemonState> {
  final PokemonRepositoryBase _repository;

  PokemonCubit(this._repository) : super(PokemonInitialState());

  Future<void> loadPokemon() async {
    try {
      emit(PokemonLoadingState());

      final pokemon = await _repository.pokemon();

      emit(PokemonCompleteState(pokemon));
    } on Exception catch (e) {
      emit(PokemonErrorState(e.toString()));
    }
  }
}

abstract class PokemonState {
  List<Object> get props => [];
}

class PokemonInitialState extends PokemonState {}

class PokemonLoadingState extends PokemonState {}

class PokemonCompleteState extends PokemonState {
  final List<Pokemon> pokemon;

  PokemonCompleteState(this.pokemon);
}

class PokemonErrorState extends PokemonState {
  final String message;

  PokemonErrorState(this.message);
}
