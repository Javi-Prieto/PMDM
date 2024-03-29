import 'dart:convert';

import 'package:collection/collection.dart';

import 'red_blue.dart';
import 'yellow.dart';

class GenerationI {
  RedBlue? redBlue;
  Yellow? yellow;

  GenerationI({this.redBlue, this.yellow});

  factory GenerationI.fromMap(Map<String, dynamic> data) => GenerationI(
        redBlue: data['red-blue'] == null
            ? null
            : RedBlue.fromMap(data['red-blue'] as Map<String, dynamic>),
        yellow: data['yellow'] == null
            ? null
            : Yellow.fromMap(data['yellow'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toMap() => {
        'red-blue': redBlue?.toMap(),
        'yellow': yellow?.toMap(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [GenerationI].
  factory GenerationI.fromJson(String data) {
    return GenerationI.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [GenerationI] to a JSON string.
  String toJson() => json.encode(toMap());

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! GenerationI) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toMap(), toMap());
  }

  @override
  int get hashCode => redBlue.hashCode ^ yellow.hashCode;
}
