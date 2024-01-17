import 'dart:convert';

import 'package:collection/collection.dart';

import 'type.dart';

class Type {
  int? slot;
  Type? type;

  Type({this.slot, this.type});

  factory Type.fromMap(Map<String, dynamic> data) => Type(
        slot: data['slot'] as int?,
        type: data['type'] == null
            ? null
            : Type.fromMap(data['type'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toMap() => {
        'slot': slot,
        'type': type?.toMap(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Type].
  factory Type.fromJson(String data) {
    return Type.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Type] to a JSON string.
  String toJson() => json.encode(toMap());

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! Type) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toMap(), toMap());
  }

  @override
  int get hashCode => slot.hashCode ^ type.hashCode;
}
