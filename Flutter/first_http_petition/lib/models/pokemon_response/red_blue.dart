import 'dart:convert';

import 'package:collection/collection.dart';

class RedBlue {
  String? backDefault;
  String? backGray;
  String? backTransparent;
  String? frontDefault;
  String? frontGray;
  String? frontTransparent;

  RedBlue({
    this.backDefault,
    this.backGray,
    this.backTransparent,
    this.frontDefault,
    this.frontGray,
    this.frontTransparent,
  });

  factory RedBlue.fromMap(Map<String, dynamic> data) => RedBlue(
        backDefault: data['back_default'] as String?,
        backGray: data['back_gray'] as String?,
        backTransparent: data['back_transparent'] as String?,
        frontDefault: data['front_default'] as String?,
        frontGray: data['front_gray'] as String?,
        frontTransparent: data['front_transparent'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'back_default': backDefault,
        'back_gray': backGray,
        'back_transparent': backTransparent,
        'front_default': frontDefault,
        'front_gray': frontGray,
        'front_transparent': frontTransparent,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [RedBlue].
  factory RedBlue.fromJson(String data) {
    return RedBlue.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [RedBlue] to a JSON string.
  String toJson() => json.encode(toMap());

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! RedBlue) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toMap(), toMap());
  }

  @override
  int get hashCode =>
      backDefault.hashCode ^
      backGray.hashCode ^
      backTransparent.hashCode ^
      frontDefault.hashCode ^
      frontGray.hashCode ^
      frontTransparent.hashCode;
}
