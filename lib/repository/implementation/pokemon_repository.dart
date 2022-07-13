import 'package:pokemon/data_provider/pokemon_provider.dart';
import 'package:pokemon/repository/pokemon_repository.dart';

class PokemonRepository extends PokemonRepositoryBase {
  final PokemonProvider _provider;

  PokemonRepository(this._provider);
  @override
  Future pokemon() => _provider.pokemon();
}
