import 'dart:convert';

import 'package:collection/collection.dart';

class VersionGroup {
  String? name;
  String? url;

  VersionGroup({this.name, this.url});

  factory VersionGroup.fromMap(Map<String, dynamic> data) => VersionGroup(
        name: data['name'] as String?,
        url: data['url'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'name': name,
        'url': url,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [VersionGroup].
  factory VersionGroup.fromJson(String data) {
    return VersionGroup.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [VersionGroup] to a JSON string.
  String toJson() => json.encode(toMap());

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! VersionGroup) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toMap(), toMap());
  }

  @override
  int get hashCode => name.hashCode ^ url.hashCode;
}
