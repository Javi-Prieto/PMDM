import 'dart:convert';

import 'package:collection/collection.dart';

import 'icons.dart';

class GenerationViii {
  Icons? icons;

  GenerationViii({this.icons});

  factory GenerationViii.fromMap(Map<String, dynamic> data) {
    return GenerationViii(
      icons: data['icons'] == null
          ? null
          : Icons.fromMap(data['icons'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toMap() => {
        'icons': icons?.toMap(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [GenerationViii].
  factory GenerationViii.fromJson(String data) {
    return GenerationViii.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [GenerationViii] to a JSON string.
  String toJson() => json.encode(toMap());

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! GenerationViii) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toMap(), toMap());
  }

  @override
  int get hashCode => icons.hashCode;
}
