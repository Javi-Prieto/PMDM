import 'dart:convert';

import 'package:collection/collection.dart';

class Crystal {
  String? backDefault;
  String? backShiny;
  String? backShinyTransparent;
  String? backTransparent;
  String? frontDefault;
  String? frontShiny;
  String? frontShinyTransparent;
  String? frontTransparent;

  Crystal({
    this.backDefault,
    this.backShiny,
    this.backShinyTransparent,
    this.backTransparent,
    this.frontDefault,
    this.frontShiny,
    this.frontShinyTransparent,
    this.frontTransparent,
  });

  factory Crystal.fromMap(Map<String, dynamic> data) => Crystal(
        backDefault: data['back_default'] as String?,
        backShiny: data['back_shiny'] as String?,
        backShinyTransparent: data['back_shiny_transparent'] as String?,
        backTransparent: data['back_transparent'] as String?,
        frontDefault: data['front_default'] as String?,
        frontShiny: data['front_shiny'] as String?,
        frontShinyTransparent: data['front_shiny_transparent'] as String?,
        frontTransparent: data['front_transparent'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'back_default': backDefault,
        'back_shiny': backShiny,
        'back_shiny_transparent': backShinyTransparent,
        'back_transparent': backTransparent,
        'front_default': frontDefault,
        'front_shiny': frontShiny,
        'front_shiny_transparent': frontShinyTransparent,
        'front_transparent': frontTransparent,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Crystal].
  factory Crystal.fromJson(String data) {
    return Crystal.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Crystal] to a JSON string.
  String toJson() => json.encode(toMap());

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! Crystal) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toMap(), toMap());
  }

  @override
  int get hashCode =>
      backDefault.hashCode ^
      backShiny.hashCode ^
      backShinyTransparent.hashCode ^
      backTransparent.hashCode ^
      frontDefault.hashCode ^
      frontShiny.hashCode ^
      frontShinyTransparent.hashCode ^
      frontTransparent.hashCode;
}
