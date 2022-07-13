// To parse this JSON data, do
//
//     final pagePokemon = pagePokemonFromJson(jsonString);

import 'dart:convert';

PagePokemon pagePokemonFromJson(String str) =>
    PagePokemon.fromJson(json.decode(str));

class PagePokemon {
  PagePokemon({
    required this.count,
    required this.next,
    required this.previous,
    required this.results,
  });

  int count;
  String next;
  dynamic previous;
  List<Result> results;

  factory PagePokemon.fromJson(Map<String, dynamic> json) => PagePokemon(
        count: json["count"],
        next: json["next"],
        previous: json["previous"],
        results:
            List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
      );
}

class Result {
  Result({
    required this.name,
    required this.url,
  });

  String name;
  String url;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        name: json["name"],
        url: json["url"],
      );
}
