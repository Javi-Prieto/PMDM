import 'dart:convert';

import 'package:collection/collection.dart';

import 'icons.dart';
import 'ultra_sun_ultra_moon.dart';

class GenerationVii {
  Icons? icons;
  UltraSunUltraMoon? ultraSunUltraMoon;

  GenerationVii({this.icons, this.ultraSunUltraMoon});

  factory GenerationVii.fromMap(Map<String, dynamic> data) => GenerationVii(
        icons: data['icons'] == null
            ? null
            : Icons.fromMap(data['icons'] as Map<String, dynamic>),
        ultraSunUltraMoon: data['ultra-sun-ultra-moon'] == null
            ? null
            : UltraSunUltraMoon.fromMap(
                data['ultra-sun-ultra-moon'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toMap() => {
        'icons': icons?.toMap(),
        'ultra-sun-ultra-moon': ultraSunUltraMoon?.toMap(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [GenerationVii].
  factory GenerationVii.fromJson(String data) {
    return GenerationVii.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [GenerationVii] to a JSON string.
  String toJson() => json.encode(toMap());

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! GenerationVii) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toMap(), toMap());
  }

  @override
  int get hashCode => icons.hashCode ^ ultraSunUltraMoon.hashCode;
}
