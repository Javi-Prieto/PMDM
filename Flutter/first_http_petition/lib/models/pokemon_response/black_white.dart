import 'dart:convert';

import 'package:collection/collection.dart';

import 'animated.dart';

class BlackWhite {
  Animated? animated;
  String? backDefault;
  dynamic backFemale;
  String? backShiny;
  dynamic backShinyFemale;
  String? frontDefault;
  dynamic frontFemale;
  String? frontShiny;
  dynamic frontShinyFemale;

  BlackWhite({
    this.animated,
    this.backDefault,
    this.backFemale,
    this.backShiny,
    this.backShinyFemale,
    this.frontDefault,
    this.frontFemale,
    this.frontShiny,
    this.frontShinyFemale,
  });

  factory BlackWhite.fromMap(Map<String, dynamic> data) => BlackWhite(
        animated: data['animated'] == null
            ? null
            : Animated.fromMap(data['animated'] as Map<String, dynamic>),
        backDefault: data['back_default'] as String?,
        backFemale: data['back_female'] as dynamic,
        backShiny: data['back_shiny'] as String?,
        backShinyFemale: data['back_shiny_female'] as dynamic,
        frontDefault: data['front_default'] as String?,
        frontFemale: data['front_female'] as dynamic,
        frontShiny: data['front_shiny'] as String?,
        frontShinyFemale: data['front_shiny_female'] as dynamic,
      );

  Map<String, dynamic> toMap() => {
        'animated': animated?.toMap(),
        'back_default': backDefault,
        'back_female': backFemale,
        'back_shiny': backShiny,
        'back_shiny_female': backShinyFemale,
        'front_default': frontDefault,
        'front_female': frontFemale,
        'front_shiny': frontShiny,
        'front_shiny_female': frontShinyFemale,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [BlackWhite].
  factory BlackWhite.fromJson(String data) {
    return BlackWhite.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [BlackWhite] to a JSON string.
  String toJson() => json.encode(toMap());

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! BlackWhite) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toMap(), toMap());
  }

  @override
  int get hashCode =>
      animated.hashCode ^
      backDefault.hashCode ^
      backFemale.hashCode ^
      backShiny.hashCode ^
      backShinyFemale.hashCode ^
      frontDefault.hashCode ^
      frontFemale.hashCode ^
      frontShiny.hashCode ^
      frontShinyFemale.hashCode;
}
