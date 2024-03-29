import 'dart:convert';

import 'package:collection/collection.dart';

class UltraSunUltraMoon {
  String? frontDefault;
  dynamic frontFemale;
  String? frontShiny;
  dynamic frontShinyFemale;

  UltraSunUltraMoon({
    this.frontDefault,
    this.frontFemale,
    this.frontShiny,
    this.frontShinyFemale,
  });

  factory UltraSunUltraMoon.fromMap(Map<String, dynamic> data) {
    return UltraSunUltraMoon(
      frontDefault: data['front_default'] as String?,
      frontFemale: data['front_female'] as dynamic,
      frontShiny: data['front_shiny'] as String?,
      frontShinyFemale: data['front_shiny_female'] as dynamic,
    );
  }

  Map<String, dynamic> toMap() => {
        'front_default': frontDefault,
        'front_female': frontFemale,
        'front_shiny': frontShiny,
        'front_shiny_female': frontShinyFemale,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [UltraSunUltraMoon].
  factory UltraSunUltraMoon.fromJson(String data) {
    return UltraSunUltraMoon.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [UltraSunUltraMoon] to a JSON string.
  String toJson() => json.encode(toMap());

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! UltraSunUltraMoon) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toMap(), toMap());
  }

  @override
  int get hashCode =>
      frontDefault.hashCode ^
      frontFemale.hashCode ^
      frontShiny.hashCode ^
      frontShinyFemale.hashCode;
}
