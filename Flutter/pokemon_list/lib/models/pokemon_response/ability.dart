import 'dart:convert';

import 'package:collection/collection.dart';

import 'ability.dart';

class Ability {
  Ability? ability;
  bool? isHidden;
  int? slot;

  Ability({this.ability, this.isHidden, this.slot});

  factory Ability.fromMap(Map<String, dynamic> data) => Ability(
        ability: data['ability'] == null
            ? null
            : Ability.fromMap(data['ability'] as Map<String, dynamic>),
        isHidden: data['is_hidden'] as bool?,
        slot: data['slot'] as int?,
      );

  Map<String, dynamic> toMap() => {
        'ability': ability?.toMap(),
        'is_hidden': isHidden,
        'slot': slot,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Ability].
  factory Ability.fromJson(String data) {
    return Ability.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Ability] to a JSON string.
  String toJson() => json.encode(toMap());

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! Ability) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toMap(), toMap());
  }

  @override
  int get hashCode => ability.hashCode ^ isHidden.hashCode ^ slot.hashCode;
}
