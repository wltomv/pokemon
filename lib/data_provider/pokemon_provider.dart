import 'dart:convert';
import 'package:pokemon/models/models.dart';
import 'package:http/http.dart' as http;

class PokemonProvider {
  static const String _baseUrl = 'https://pokeapi.co/api/v2/';
  static const String pokemonUrl = 'pokemon';

  final http.Client _httpClient;

  PokemonProvider({http.Client? httpClient})
      : _httpClient = httpClient ?? http.Client();

  Future pokemon() async {
    final result = await _callGetApi(endpoint: pokemonUrl);

    return result.results;
  }

  Future<PagePokemon> _callGetApi({
    required String endpoint,
  }) async {
    try {
      var uri = Uri.https(_baseUrl, endpoint);

      final response = await _httpClient.get(uri);
      final result = PagePokemon.fromJson(json.decode(response.body));
      print(response.body);
      return result;
    } catch (e) {
      throw Exception(e);
    }
  }
}
