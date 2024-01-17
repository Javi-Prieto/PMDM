import 'dart:convert';

import 'package:collection/collection.dart';

import 'stat.dart';

class Stat {
  int? baseStat;
  int? effort;
  Stat? stat;

  Stat({this.baseStat, this.effort, this.stat});

  factory Stat.fromMap(Map<String, dynamic> data) => Stat(
        baseStat: data['base_stat'] as int?,
        effort: data['effort'] as int?,
        stat: data['stat'] == null
            ? null
            : Stat.fromMap(data['stat'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toMap() => {
        'base_stat': baseStat,
        'effort': effort,
        'stat': stat?.toMap(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Stat].
  factory Stat.fromJson(String data) {
    return Stat.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Stat] to a JSON string.
  String toJson() => json.encode(toMap());

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! Stat) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toMap(), toMap());
  }

  @override
  int get hashCode => baseStat.hashCode ^ effort.hashCode ^ stat.hashCode;
}
