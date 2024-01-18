import 'dart:convert';

class SubType {
  String? name;
  String? url;

  SubType({this.name, this.url});

  factory SubType.fromMap(Map<String, dynamic> data) => SubType(
        name: data['name'] as String?,
        url: data['url'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'name': name,
        'url': url,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [SubType].
  factory SubType.fromJson(String data) {
    return SubType.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [SubType] to a JSON string.
  String toJson() => json.encode(toMap());
}
