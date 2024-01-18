import 'dart:convert';

import 'result.dart';

class PokemonList {
  int? count;
  String? next;
  dynamic previous;
  List<Result>? results;

  PokemonList({this.count, this.next, this.previous, this.results});

  factory PokemonList.fromMap(Map<String, dynamic> data) => PokemonList(
        count: data['count'] as int?,
        next: data['next'] as String?,
        previous: data['previous'] as dynamic,
        results: (data['results'] as List<dynamic>?)
            ?.map((e) => Result.fromMap(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toMap() => {
        'count': count,
        'next': next,
        'previous': previous,
        'results': results?.map((e) => e.toMap()).toList(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [PokemonList].
  factory PokemonList.fromJson(String data) {
    return PokemonList.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [PokemonList] to a JSON string.
  String toJson() => json.encode(toMap());
}
