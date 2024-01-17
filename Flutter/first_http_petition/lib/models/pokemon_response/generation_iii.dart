import 'dart:convert';

import 'package:collection/collection.dart';

import 'emerald.dart';
import 'firered_leafgreen.dart';
import 'ruby_sapphire.dart';

class GenerationIii {
  Emerald? emerald;
  FireredLeafgreen? fireredLeafgreen;
  RubySapphire? rubySapphire;

  GenerationIii({this.emerald, this.fireredLeafgreen, this.rubySapphire});

  factory GenerationIii.fromMap(Map<String, dynamic> data) => GenerationIii(
        emerald: data['emerald'] == null
            ? null
            : Emerald.fromMap(data['emerald'] as Map<String, dynamic>),
        fireredLeafgreen: data['firered-leafgreen'] == null
            ? null
            : FireredLeafgreen.fromMap(
                data['firered-leafgreen'] as Map<String, dynamic>),
        rubySapphire: data['ruby-sapphire'] == null
            ? null
            : RubySapphire.fromMap(
                data['ruby-sapphire'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toMap() => {
        'emerald': emerald?.toMap(),
        'firered-leafgreen': fireredLeafgreen?.toMap(),
        'ruby-sapphire': rubySapphire?.toMap(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [GenerationIii].
  factory GenerationIii.fromJson(String data) {
    return GenerationIii.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [GenerationIii] to a JSON string.
  String toJson() => json.encode(toMap());

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! GenerationIii) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toMap(), toMap());
  }

  @override
  int get hashCode =>
      emerald.hashCode ^ fireredLeafgreen.hashCode ^ rubySapphire.hashCode;
}
