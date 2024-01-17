import 'dart:convert';

import 'package:collection/collection.dart';

import 'black_white.dart';

class GenerationV {
  BlackWhite? blackWhite;

  GenerationV({this.blackWhite});

  factory GenerationV.fromMap(Map<String, dynamic> data) => GenerationV(
        blackWhite: data['black-white'] == null
            ? null
            : BlackWhite.fromMap(data['black-white'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toMap() => {
        'black-white': blackWhite?.toMap(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [GenerationV].
  factory GenerationV.fromJson(String data) {
    return GenerationV.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [GenerationV] to a JSON string.
  String toJson() => json.encode(toMap());

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! GenerationV) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toMap(), toMap());
  }

  @override
  int get hashCode => blackWhite.hashCode;
}
