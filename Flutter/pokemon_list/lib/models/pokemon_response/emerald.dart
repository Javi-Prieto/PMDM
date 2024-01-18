import 'dart:convert';

import 'package:collection/collection.dart';

class Emerald {
  String? frontDefault;
  String? frontShiny;

  Emerald({this.frontDefault, this.frontShiny});

  factory Emerald.fromMap(Map<String, dynamic> data) => Emerald(
        frontDefault: data['front_default'] as String?,
        frontShiny: data['front_shiny'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'front_default': frontDefault,
        'front_shiny': frontShiny,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Emerald].
  factory Emerald.fromJson(String data) {
    return Emerald.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Emerald] to a JSON string.
  String toJson() => json.encode(toMap());

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! Emerald) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toMap(), toMap());
  }

  @override
  int get hashCode => frontDefault.hashCode ^ frontShiny.hashCode;
}
