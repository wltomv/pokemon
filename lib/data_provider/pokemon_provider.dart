import 'dart:convert';
import 'package:pokemon/models/models.dart';
import 'package:http/http.dart' as http;

class PokemonProvider {
  static const String _generalUrl = "https://pokeapi.co/api/v2/pokemon";

  final http.Client _httpClient;

  PokemonProvider({http.Client? httpClient})
      : _httpClient = httpClient ?? http.Client();

  Future<List<Pokemon>> pokemon() async {
    final result = await _callGetApi(url: _generalUrl);
    final page = PagePokemon.fromJson(json.decode(result));
    List<Pokemon> pokemonDetails = [];
    for (var element in page.results) {
      final response = await _callGetApi(url: element.url);
      final pokemonElement = Pokemon.fromJson(json.decode(response));
      //print(pokemonElement.name);
      pokemonDetails.add(pokemonElement);
    }
    return pokemonDetails;
  }

  Future _callGetApi({
    required String url,
  }) async {
    try {
      // var uri = Uri.https(_baseUrl, endpoint, {});
      var uri = Uri.parse(url);
      final response = await _httpClient.get(uri);
      //print(response.body);
      return response.body;
    } catch (e) {
      throw Exception(e);
    }
  }
}
