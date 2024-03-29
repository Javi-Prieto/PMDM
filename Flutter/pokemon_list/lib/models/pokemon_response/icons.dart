import 'dart:convert';

import 'package:collection/collection.dart';

class Icons {
  String? frontDefault;
  dynamic frontFemale;

  Icons({this.frontDefault, this.frontFemale});

  factory Icons.fromMap(Map<String, dynamic> data) => Icons(
        frontDefault: data['front_default'] as String?,
        frontFemale: data['front_female'] as dynamic,
      );

  Map<String, dynamic> toMap() => {
        'front_default': frontDefault,
        'front_female': frontFemale,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Icons].
  factory Icons.fromJson(String data) {
    return Icons.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Icons] to a JSON string.
  String toJson() => json.encode(toMap());

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! Icons) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toMap(), toMap());
  }

  @override
  int get hashCode => frontDefault.hashCode ^ frontFemale.hashCode;
}
